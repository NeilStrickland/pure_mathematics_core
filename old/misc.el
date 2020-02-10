(defun deprosper (b e)
  (interactive "r")
  (save-restriction 
    (narrow-to-region b e)
    (goto-char (point-min))
    (while (re-search-forward "\\\\\\(from\\|only\\)Slide\\*?{[0-9]*}" nil t)
      (replace-match ""))))
