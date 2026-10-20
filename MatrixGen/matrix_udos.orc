; ============================================================
; matrix_udos.orc
; UDOs for manipulating square N x N matrices (f-tables) used
; as Markov transition matrices in generative composition.
;
; Convention: every matrix is a row-major f-table of size N*N,
; where N = giN (must be defined in the main .csd before
; #include-ing this file).
; ============================================================

; ------------------------------------------------------------
; MatInterp - interpolates between two N x N matrices
;
; iTabOut  MatInterp  iTabA, iTabB, ipos, itype
;
;   iTabA, iTabB : input f-tables (size N*N)
;   ipos         : interpolation position, 0 = pure A, 1 = pure B
;   itype        : 0 = linear, 1 = exponential (geometric)
;
; Returns the table number of a newly generated f-table.
; ------------------------------------------------------------
opcode MatInterp, i, iiii

iTabA, iTabB, ipos, itype xin

iSize = giN * giN
iTabOut ftgen 0, 0, -iSize, -2, 0   ; empty output table, filled below

; ---- pass 1: compute each cell independently ----
indx = 0
until indx == iSize do
    ia table indx, iTabA
    ib table indx, iTabB

    if itype == 0 then
        ; linear interpolation: straight line from ia to ib
        ival = ia + (ib - ia) * ipos
    else
        ; exponential (geometric) interpolation
        ; clamp ipos/ia away from exact 0 to avoid div-by-zero / log(0)
        ipos_safe = (ipos <= 0 ? 0.0001 : (ipos >= 1 ? 0.9999 : ipos))
        ia_safe = (ia <= 0 ? 0.0001 : ia)
        ival = ia_safe * (ib / ia_safe) ^ ipos_safe
    endif

tablew ival, indx, iTabOut
    indx += 1
od

; ---- pass 2: exponential type only - renormalize each row so it sums to 1 ----
; (geometric interpolation does not preserve row sum on its own;
;  linear interpolation already sums to 1 and does not need this step)
if itype == 1 then
   irow = 0
    until irow == giN do
        isum = 0
        icol = 0
        until icol == giN do
            indx2 = irow * giN + icol
            ival2 table indx2, iTabOut
            isum = isum + ival2
            icol += 1
        od
        icol = 0
        until icol == giN do
            indx2 = irow * giN + icol
            ival2 table indx2, iTabOut
            ival2 = ival2 / isum
            tablew ival2, indx2, iTabOut
            icol += 1
        od
        irow += 1
    od
endif

xout iTabOut
endop

; ------------------------------------------------------------
; MatEntropy - pushes a matrix toward a uniform distribution
; (every state equally likely), by degree. Named after entropy:
; a uniform matrix is the maximum-entropy transition matrix.
;
; iTabOut  MatEntropy  iTabSrc, iamount
;
;   iTabSrc : input f-table (size N*N)
;   iamount : 0 = original matrix, 1 = fully uniform (1/N per cell)
;
; Deterministic: implemented as MatInterp between iTabSrc and a
; freshly built uniform matrix, linear type. Structural zeros in
; iTabSrc relax toward 1/N as iamount increases, same as MatInterp.
; ------------------------------------------------------------
opcode MatEntropy, i, ii

iTabSrc, iamount xin

iSize = giN * giN
iUniform ftgen 0, 0, -iSize, -2, 0

indx = 0
until indx == iSize do
    tablew 1/giN, indx, iUniform
    indx += 1
od

iTabOut MatInterp iTabSrc, iUniform, iamount, 0
xout iTabOut
endop

; ------------------------------------------------------------
; MatRotate - cyclically permutes the states of a matrix.
;
; iTabOut  MatRotate  iTabSrc, ishift, imode
;
;   iTabSrc : input f-table (size N*N)
;   ishift  : cyclic shift amount (int, can be negative or >= N)
;   imode   : 0 = shift rows AND columns together (state relabeling -
;                 use for diagonal-dominant matrices, e.g. "each
;                 state prefers to stay in itself"; the attractor
;                 moves to a new diagonal position, matrix stays a
;                 coherent relabeling of the same states)
;             1 = shift columns only, rows untouched (privilege
;                 shift - use for matrices where a single column is
;                 a dominant "target" attractor regardless of
;                 origin; swaps which state is the privileged target)
;
; Returns the table number of a newly generated f-table.
; ------------------------------------------------------------
opcode MatRotate, i, iii

iTabSrc, ishift, imode xin

iSize = giN * giN
iTabOut ftgen 0, 0, -iSize, -2, 0

ishiftMod = ishift % giN
ishiftMod = (ishiftMod < 0 ? ishiftMod + giN : ishiftMod)

irow = 0
until irow == giN do
    if imode == 0 then
        inewrow = (irow + ishiftMod) % giN
    else
        inewrow = irow
    endif
    icol = 0
    until icol == giN do
        inewcol = (icol + ishiftMod) % giN
        isrc = irow * giN + icol
        idst = inewrow * giN + inewcol
        ival table isrc, iTabSrc
        tablew ival, idst, iTabOut
        icol += 1
    od
    irow += 1
od

xout iTabOut
endop

; ------------------------------------------------------------
; BuildBiasedMatrix - generates a transition matrix from affinity
; scores instead of hand-typed probabilities. Each cell gets a
; score, which softmax turns into a valid probability distribution
; (every row sums to 1):
;
;   score[i][j] = targetBoost[j] + (selfBoost[i] if i == j else 0)
;   p[i][j]     = exp(score[i][j] / iTemperature) / (row sum of exp)
;
; iTabOut  BuildBiasedMatrix  iTargetBoostTab, iSelfBoostTab, iTemperature
;
;   iTargetBoostTab : f-table (size giN) -- cell j = bonus applied to
;                     column j in EVERY row (a general "pull" toward
;                     state j, from any origin). 0 = no bonus.
;   iSelfBoostTab   : f-table (size giN) -- cell i = extra bonus
;                     applied only at [i,i] (a tendency for state i
;                     to stay in itself). 0 = no bonus.
;   iTemperature    : controls how sharp the result is -- low values
;                     let the scores dominate (more extreme/peaked
;                     rows), high values flatten everything toward
;                     uniform.
;
; A cell with no boost at all still gets a nonzero score (0) and
; therefore a nonzero probability after softmax -- there is no
; separate "baseline" parameter, it falls out of the normalization
; automatically (every state stays reachable, avoiding hard zeros).
;
; Returns the table number of a newly generated f-table.
; ------------------------------------------------------------
opcode BuildBiasedMatrix, i, iii

iTargetBoostTab, iSelfBoostTab, iTemperature xin

iSize = giN * giN
iTabOut ftgen 0, 0, -iSize, -2, 0

; ---- pass 1: score -> exp(score/T) per cell ----
irow = 0
until irow == giN do
    icol = 0
    until icol == giN do
        itbias table icol, iTargetBoostTab
        if irow == icol then
            iself table irow, iSelfBoostTab
        else
            iself = 0
        endif
        iscore = itbias + iself
        ival = exp(iscore / iTemperature)
        tablew ival, irow * giN + icol, iTabOut
        icol += 1
    od
    irow += 1
od

; ---- pass 2: renormalize each row so it sums to 1 (same pattern as MatInterp) ----
irow = 0
until irow == giN do
    isum = 0
    icol = 0
    until icol == giN do
        indx2 = irow * giN + icol
        ival2 table indx2, iTabOut
        isum = isum + ival2
        icol += 1
    od
    icol = 0
    until icol == giN do
        indx2 = irow * giN + icol
        ival2 table indx2, iTabOut
        ival2 = ival2 / isum
        tablew ival2, indx2, iTabOut
        icol += 1
    od
    irow += 1
od

xout iTabOut
endop
