(defun mfppst ()
  (interactive)
  (let (mfstart mfend a b c)
    (search-backward "\\\n[")
    (setq mfstart (point-marker))
    (forward-char 1)
    (forward-sexp 1)
    (setq mfend (point-marker))
    (save-restriction
      (narrow-to-region mfstart mfend)
      (goto-char (point-min))
      (insert "")
      (while (search-forward "tlabel" nil t)
	(replace-match "rput"))
)
))

(defun newslide ()
  (interactive)
  (insert "\\overlays{10}{%\n\\begin{slide}{}\n")
  (insert "\\begin{itemize}\n")
  (insert " \\fromSlide{2}{\n")
  (insert "  \\item\n")
  (insert " }\n")
  (insert "\\end{itemize}\n\\end{slide}\n}\n")
  (search-backward "begin{slide}{")
  (forward-char 13)
)

(defun newoverlay ()
  (interactive)
  (beginning-of-line)
  (insert " \\fromSlide{}{\n  \\item\n }\n")
  (search-backward "fromSlide{")
  (forward-char 10)
)