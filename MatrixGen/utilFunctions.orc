; ============================================================
; utilFunctions.orc
; Print/debug utilities for the matrix module. Not part of the
; compositional logic (matrix_udos.orc/composition_udos.orc) --
; just ways to look at a matrix in the terminal while testing or
; playing with parameters. All assume giN is already defined.
; ============================================================

; ------------------------------------------------------------
; PrintMat - prints an N x N matrix with exact numeric values,
; plus each row's sum (should be ~1.0 for a valid transition matrix).
;
; PrintMat  iTab, Slabel
; ------------------------------------------------------------
opcode PrintMat, 0, iS
  iTab, Slabel xin
  prints "%s\n", Slabel
  irow = 0
  until irow == giN do
    icol = 0
    Sline = ""
    isum = 0
    until icol == giN do
      indx = irow * giN + icol
      ival table indx, iTab
      Sline strcat Sline, sprintf("%.3f ", ival)
      isum = isum + ival
      icol += 1
    od
    Sline strcat Sline, sprintf("  (soma: %.3f)", isum)
    prints "%s\n", Sline
    irow += 1
  od
  prints "\n"
endop

; ------------------------------------------------------------
; PrintMatHeat - prints an N x N matrix as a compact text
; "heatmap": one digit per cell (0 = near-zero probability, 9 =
; near-certain), for a quick visual read of where probability
; mass concentrates without parsing exact numbers.
;
; PrintMatHeat  iTab, Slabel
; ------------------------------------------------------------
opcode PrintMatHeat, 0, iS
  iTab, Slabel xin
  prints "%s (mapa de calor 0-9)\n", Slabel
  irow = 0
  until irow == giN do
    icol = 0
    Sline = ""
    until icol == giN do
      indx = irow * giN + icol
      ival table indx, iTab
      ilevel = int(ival * 10)
      ilevel = (ilevel > 9 ? 9 : ilevel)
      Sd sprintf "%d ", ilevel
      Sline strcat Sline, Sd
      icol += 1
    od
    prints "%s\n", Sline
    irow += 1
  od
  prints "\n"
endop
