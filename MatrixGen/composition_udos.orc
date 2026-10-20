; ============================================================
; composition_udos.orc
; Composition engine UDOs: Markov chain navigation over musical
; material (PlayChain), and a "chain of chains" meta-composition
; layer built on top of it (PlayMetaChain).
;
; Convention (shared with matrix_udos.orc): everything is a table
; number. A "material bank" is an f-table whose N cells are the
; table numbers of each state's rhythm table (giMatBank), pitch
; table (giPitchBank), or variant-selection mode (giModeBank) -- so
; rhythm, pitch AND variant-selection behavior can all differ
; freely per state, independently. Which banks and instrument to
; use are read from the globals giMatBank, giPitchBank, giModeBank,
; giPlayInstr -- set by the composer (or by PlayMetaChain, between
; chain calls) before calling PlayChain. This keeps PlayChain's
; signature minimal and lets each call use different material
; without an extra parameter.
;
; A "visit" to a state plays exactly ONE variant of that state's
; material (not all of them) -- one visit = one Markov step = one
; musical gesture. Which variant gets served is decided by the
; state's mode (giModeBank):
;   0 = shuffle bag: serve variants in a shuffled order without
;       repeating any until all have been served, then reshuffle
;       and start over. Default/general-purpose mode.
;   1 = uniform with repetition: draw a variant uniformly at
;       random every visit, independent each time (repeats freely).
;   2 = fixed cyclic counter: no randomness at all -- always serves
;       variants in the same fixed order 0,1,2,...,N-1,0,1,...
;       (useful for a deterministic sub-state cycle).
; Modes 0 and 2 share the same underlying mechanism (an "order"
; table + a position pointer per state, both persisted in
; giSeqOrderBank/giSeqPosBank) -- they only differ in whether the
; order gets reshuffled on wraparound (mode 0) or stays fixed
; forever (mode 2). Mode 1 needs no persisted state at all. States
; with a single variant are unaffected by any mode.
; ============================================================

; ------------------------------------------------------------
; NextMarkovState - given the current state, a flattened N x N
; transition table and N, draws and returns the next state.
; Generic: knows nothing about rhythm/material, just navigates
; the matrix. (Same opcode already validated in experimento5.csd.)
;
; If a row's probabilities don't sum to exactly 1.0 (rounding in the
; source data) and the draw falls past the cumulative sum, the
; search runs out of columns (indx reaches inStates) without ever
; matching -- clamp to the last valid state (inStates-1) instead of
; returning an out-of-range index.
; ------------------------------------------------------------
opcode NextMarkovState, i, iii
  istate, itransTab, inStates xin
  irand    random 0, 1
  icum     = 0
  indx     = 0
  buscando:
    iprob  table istate*inStates + indx, itransTab
    icum   = icum + iprob
    if (irand < icum) igoto achou
    indx   = indx + 1
  if (indx < inStates) igoto buscando
  achou:
  inext    = (indx >= inStates ? inStates - 1 : indx)
  xout inext
endop


; ------------------------------------------------------------
; InitVariantOrder - creates a small f-table [0, 1, ..., N-1],
; used to seed giSeqOrderBank for a state that uses mode 0 or 2.
;
; iTabOut  InitVariantOrder  iNumVariants
; ------------------------------------------------------------
opcode InitVariantOrder, i, i
  iNumVariants xin
  iTabOut ftgen 0, 0, -iNumVariants, -2, 0
  ii = 0
  until ii == iNumVariants do
    tablew ii, ii, iTabOut
    ii += 1
  od
  xout iTabOut
endop


; ------------------------------------------------------------
; PlayChain - plays one Markov chain over N states of musical
; material. On each visit, plays ONE variant of the current
; state's material (chosen per that state's mode -- see header),
; then transitions to the next state via NextMarkovState. Never
; transitions before the first visit -- the chain always starts by
; actually playing iStartState.
;
; iEnd  PlayChain  itransTab, iN, iStartState, iVisits, itime, ipan
;
;   itransTab   : flattened N x N transition matrix (table number)
;   iN          : number of states
;   iStartState : state the chain starts on (played first, no
;                 transition happens before this)
;   iVisits     : how many states to visit (each visit = one
;                 variant of that state's material)
;   itime       : score time to start scheduling notes at
;   ipan        : pan value forwarded to each note event
;
; Reads globals: giMatBank (rhythm-table number per state),
; giPitchBank (pitch-table number per state), giModeBank
; (variant-selection mode per state, 0/1/2 -- see header),
; giSlotsBank (explicit slots-per-variant count per state),
; giSeqOrderBank/giSeqPosBank (persisted order/position per state,
; used by modes 0 and 2), giPlayInstr (instrument triggered via
; event_i for each note).
;
; Pitch can be either shared across all variants of a state (the
; common case: ipitchTab has exactly iNumSlots cells, one pitch per
; slot position, same for every variant) or vary per variant too
; (ipitchTab has iNumVariants*iNumSlots cells, same shape as the
; rhythm table) -- detected automatically from the pitch table's
; length, so existing shared-pitch states need no changes.
;
; Returns iEnd, iEndState: the score time right after the last note
; scheduled, and the state the chain ended on. Both are meant to be
; fed into the next call when chaining multiple PlayChain calls
; (iEnd as itime, iEndState as iStartState) -- that keeps the chain
; genuinely continuous across calls, e.g. when the transition matrix
; changes mid-piece (see GestosModelInterpolation.csd/
; GestosModelEntropy.csd).
; ------------------------------------------------------------
opcode PlayChain, ii, iiiiii
  itransTab, iN, iStartState, iVisits, itime, ipan xin

  icurState = iStartState
  icount = 0
  loop:
    if (icount > 0) then
      icurState = NextMarkovState(icurState, itransTab, iN)
    endif
    prints "==> PlayChain: entrando no ESTADO %d\n", icurState
    fprints "trace_states.csv", "%.4f,%d\n", itime, icurState
    irhyTab   table icurState, giMatBank
    ipitchTab table icurState, giPitchBank
    imode     table icurState, giModeBank
    iNumSlots table icurState, giSlotsBank
    iNumVariants = ftlen(irhyTab) / iNumSlots
    iPitchIsShared = (ftlen(ipitchTab) == iNumSlots ? 1 : 0)

    ; ---- choose which variant to play this visit, per the state's mode ----
    if imode == 1 then
      ; uniform with repetition: independent draw every visit
      ivariant = int(random:i(0, iNumVariants - 0.001))
    else
      ; modes 0 (shuffle bag) and 2 (fixed cyclic counter) share the
      ; order-table + position-pointer mechanism
      iOrderTab table icurState, giSeqOrderBank
      ipos      table icurState, giSeqPosBank
      if ipos >= iNumVariants then
        ipos = 0
        if imode == 0 then
          ; reshuffle the order table (Fisher-Yates) before starting over
          ii = 0
          embaralha:
            irestantes = iNumVariants - ii
            ioffset = int(random:i(0, irestantes - 0.001))
            ij = ii + ioffset
            ia table ii, iOrderTab
            ib table ij, iOrderTab
            tablew ib, ii, iOrderTab
            tablew ia, ij, iOrderTab
            ii += 1
          loop_lt ii, 1, iNumVariants - 1, embaralha
        endif
      endif
      ivariant table ipos, iOrderTab
      ipos += 1
      tablew ipos, icurState, giSeqPosBank
    endif

    prints "    variante %d (modo %d)\n", ivariant, imode
    islot = 0
    slotloop:
      if iPitchIsShared == 1 then
        ipitch table islot, ipitchTab
      else
        ipitch table ivariant * iNumSlots + islot, ipitchTab
      endif
      irhyidx = ivariant * iNumSlots + islot
      idur table irhyidx, irhyTab
      iabsdur = abs(idur)
      if (idur > 0) then
        event_i "i", giPlayInstr, itime, iabsdur, ipitch, ipan
        fprints "trace_notes.csv", "%.4f,%.4f,%.4f,%.4f\n", itime, iabsdur, ipitch, ipan
      endif
      itime = itime + iabsdur
    loop_lt islot, 1, iNumSlots, slotloop
  loop_lt icount, 1, iVisits, loop

  xout itime, icurState
endop


; ------------------------------------------------------------
; PlayMetaChain - a "chain of chains": navigates a meta transition
; matrix whose states are entire low-level chain configurations
; (matrix, N, start state, material banks, visits), calling
; PlayChain for each meta-state visited and threading itime
; through. Same building block one level up -- a 3rd level would
; look identical.
;
; iEnd  PlayMetaChain  iMetaTab, iPlanTab, iM, iStartMeta, iMetaSteps, itime, ipan
;
;   iMetaTab    : flattened M x M meta transition matrix (table number)
;   iPlanTab    : flattened table, iM rows x 8 columns, row-major:
;                 [itransTab, iN, iStartState, iMatBank, iPitchBank,
;                  iModeBank, iSlotsBank, iVisits] per meta-state
;   iM          : number of meta-states
;   iStartMeta  : meta-state the piece starts on
;   iMetaSteps  : how many meta-states to visit
;   itime       : score time to start scheduling notes at
;   ipan        : pan value forwarded down to PlayChain/notes
;
; Sets giMatBank, giPitchBank, giModeBank and giSlotsBank before
; each PlayChain call (from iPlanTab); assumes giPlayInstr is
; already set once by the composer. NOTE: giSeqOrderBank/giSeqPosBank
; are NOT part of the plan -- they are shared globals indexed by raw
; state number, not per meta-configuration (a known simplification,
; fine as long as different meta-states don't reuse the same state
; index for unrelated material).
;
; Returns iEnd: the score time right after the last note scheduled.
; ------------------------------------------------------------
opcode PlayMetaChain, i, iiiiiii
  iMetaTab, iPlanTab, iM, iStartMeta, iMetaSteps, itime, ipan xin

  icurMeta = iStartMeta
  icount = 0
  metaloop:
    if (icount > 0) then
      icurMeta = NextMarkovState(icurMeta, iMetaTab, iM)
    endif
    prints "======> PlayMetaChain: entrando no META-ESTADO %d\n", icurMeta
    fprints "trace_meta.csv", "%.4f,%d\n", itime, icurMeta

    irow = icurMeta * 8
    itransTab   table irow,     iPlanTab
    iN          table irow + 1, iPlanTab
    iStartState table irow + 2, iPlanTab
    giMatBank   table irow + 3, iPlanTab
    giPitchBank table irow + 4, iPlanTab
    giModeBank  table irow + 5, iPlanTab
    giSlotsBank table irow + 6, iPlanTab
    iVisits     table irow + 7, iPlanTab

    itime, iDiscardState PlayChain itransTab, iN, iStartState, iVisits, itime, ipan
  loop_lt icount, 1, iMetaSteps, metaloop

  xout itime
endop
