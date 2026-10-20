; ============================================================
; export_udos.orc
; I/O utilities for the matrix module -- writes matrices out as
; ready-to-paste Csound source text, instead of Csound-internal
; f-tables. Kept separate from matrix_udos.orc: the matrix UDOs
; are pure (compute and return a table), this one has a side
; effect (writes a file).
; ============================================================

; ------------------------------------------------------------
; ExportMatrixCsound - writes a matrix as a ready-to-paste Csound
; ftgen statement into a text file, e.g.:
;
;   giMatX ftgen 0, 0, -81, -2, \
;     0.9386, 0.0063, 0.0063, ..., \
;     ...
;
; ExportMatrixCsound  iMatTab, Sname, Sfilename
;
;   iMatTab   : matrix to export (table number, size giN*giN)
;   Sname     : variable name to give it in the exported text
;               (e.g. "giMatBiased")
;   Sfilename : output text file path
;
; Values are printed with 4 decimal places, one line per matrix
; row, with a line-continuation backslash on every row except the
; last (matching the style already used by hand-typed matrices
; elsewhere in this project).
;
; NOTE: fprints opens Sfilename fresh (truncating old contents) on
; the first write to that filename within a performance, then keeps
; appending on subsequent writes -- so calling this more than once
; for the SAME Sfilename in one .csd run accumulates multiple
; matrices into one file (useful for exporting several at once);
; re-running the whole .csd from scratch starts the file over.
; ------------------------------------------------------------
opcode ExportMatrixCsound, 0, iSS
  iMatTab, Sname, Sfilename xin

  iSize = giN * giN
  fprints Sfilename, "%s ftgen 0, 0, -%d, -2, \\\\\n", Sname, iSize

  irow = 0
  until irow == giN do
    Sline = "  "
    icol = 0
    until icol == giN do
      indx = irow * giN + icol
      ival table indx, iMatTab
      iislast = (indx == iSize - 1 ? 1 : 0)
      if iislast == 1 then
        Sline strcat Sline, sprintf("%.4f", ival)
      else
        Sline strcat Sline, sprintf("%.4f, ", ival)
      endif
      icol += 1
    od
    if irow == giN - 1 then
      fprints Sfilename, "%s\n", Sline
    else
      fprints Sfilename, "%s \\\\\n", Sline
    endif
    irow += 1
  od
endop


; ------------------------------------------------------------
; ExportMatrixCSV - writes a matrix as plain CSV (no Csound syntax,
; no header row), for numeric analysis (numpy.loadtxt/pandas.read_csv):
;
;   0.938600,0.006300,0.006300,...
;   ...
;
; ExportMatrixCSV  iMatTab, Sfilename
;
;   iMatTab   : matrix to export (table number, size giN*giN)
;   Sfilename : output CSV path -- must be a downward-relative or
;               absolute path (no "../"): Csound's own #include
;               processing shifts its internal path reference, which
;               breaks "../" resolution for files it writes (not a
;               sandbox issue -- see MatrixGen/docs/MANUAL.md).
;
; 6 decimal places (more precision than ExportMatrixCsound's 4 --
; this is for computation, not just human readability).
;
; Same fprints behavior as ExportMatrixCsound: fresh file on first
; write to a given Sfilename within a performance, appends after.
; ------------------------------------------------------------
opcode ExportMatrixCSV, 0, iS
  iMatTab, Sfilename xin

  irow = 0
  until irow == giN do
    Sline = ""
    icol = 0
    until icol == giN do
      indx = irow * giN + icol
      ival table indx, iMatTab
      iislast = (icol == giN - 1 ? 1 : 0)
      if iislast == 1 then
        Sline strcat Sline, sprintf("%.6f", ival)
      else
        Sline strcat Sline, sprintf("%.6f,", ival)
      endif
      icol += 1
    od
    fprints Sfilename, "%s\n", Sline
    irow += 1
  od
endop
