<CsoundSynthesizer>
<CsOptions>
    -d
</CsOptions>

<CsInstruments>

sr = 48000
ksmps = 32
nchnls = 2
0dbfs = 1

; giN must exist before the UDO file is included: matrix_udos.orc
; uses it to know the matrix size (N x N) for every opcode inside it.
giN = 3

; The generator lives in abstractions/; the shared UDOs remain in MatrixGen/.
#include "../MatrixGen/matrix_udos.orc"

; ------------------------------------------------------------
; instr 1: test harness for BuildBiasedMatrix.
;
; It does NOT change anything in matrix_udos.orc. It only:
;   1) reads 7 numbers that Max already pushed into Csound
;      channels (via chnset), before this instrument is triggered;
;   2) packs them into the two small tables BuildBiasedMatrix
;      expects (3 cells each);
;   3) calls the opcode;
;   4) sends the resulting 3x3 matrix back to Max, one cell at
;      a time, via outvalue.
;
; Nothing here is continuous/real-time: Max triggers this
; instrument once per "bang" (e.g. "event i 1 0 0.1"), the
; instrument runs its i-rate code once, and stops. This matches
; the "set parameters, then bang" flow from the design doc.
; ------------------------------------------------------------
instr 1

    ; ---- 1) read the 7 input numbers from Max ----
    ; chnget reads whatever value Max last sent with chnset to a
    ; channel of the same name. If Max never sent anything yet,
    ; chnget returns 0 -- so it's safe to test with "missing" inputs.
    iTargetBoost1 chnget "targetBoost1"
    iTargetBoost2 chnget "targetBoost2"
    iTargetBoost3 chnget "targetBoost3"

    iSelfBoost1   chnget "selfBoost1"
    iSelfBoost2   chnget "selfBoost2"
    iSelfBoost3   chnget "selfBoost3"

    iTemperature  chnget "temperature"

    ; Guard against temperature = 0, which would mean dividing by
    ; zero inside BuildBiasedMatrix's exp(score/iTemperature).
    ; This only protects the test harness; BuildBiasedMatrix itself
    ; is untouched.
    if iTemperature == 0 then
        iTemperature = 0.0001
    endif

    ; ---- 2) pack the 3 target-boost values into one f-table ----
    ; ftgen 0 creates a table with an automatically assigned number
    ; (we never hardcode table numbers, so repeated bangs don't clash).
    ; Size -3 stores exactly three values; GEN02 (-2) preserves their original values.
    iTargetBoostTab ftgen 0, 0, -3, -2, iTargetBoost1, iTargetBoost2, iTargetBoost3

    ; ---- and the 3 self-boost values into another f-table ----
    iSelfBoostTab   ftgen 0, 0, -3, -2, iSelfBoost1, iSelfBoost2, iSelfBoost3

    ; ---- 3) call the opcode we actually want to test ----
    iResultTab BuildBiasedMatrix iTargetBoostTab, iSelfBoostTab, iTemperature

    ; ---- 4) send the 3x3 result back to Max, cell by cell ----
    ; Row-major layout: index = row*giN + col, same convention the
    ; UDO file itself documents. We print to the Csound/Max console
    ; too, so you can sanity-check the numbers without even looking
    ; at Max's outlet.
    irow = 0
    until irow == giN do
        icol = 0
        until icol == giN do
            iindex = irow * giN + icol
            ival table iindex, iResultTab

            ; Channel name encodes the cell position, e.g. "cell_0_0".
            ; Max will route these by name (see the patch instructions).
            Schan sprintf "cell_%d_%d", irow, icol
            outvalue Schan, ival

            ; printf (k-rate) never fires in an i-rate-only instrument;
            ; printf_i is the i-rate variant and runs immediately.
            printf_i "row %d col %d -> %f\n", 1, irow, icol, ival

            icol += 1
        od
        irow += 1
    od

endin

</CsInstruments>

<CsScore>
; "f 0 3600" schedules nothing by itself -- it just tells Csound the
; performance lasts an hour, so the engine stays alive and keeps
; listening for new events instead of reaching the end of the score
; and stopping. Every actual run of instr 1 comes later, in real
; time, from Max's "event i 1 0 0.1" message.
f 0 86400
</CsScore>
</CsoundSynthesizer>
