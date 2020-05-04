;;; -*- lexical-binding: t -*-

;; Use XeLaTeX to export PDF in Org-mode
(setq org-latex-pdf-process
      '("xelatex -interaction nonstopmode -output-directory %o %f"
	"xelatex -interaction nonstopmode -output-directory %o %f"
	"xelatex -interaction nonstopmode -output-directory %o %f"))

;;; org mode latex export setting
(setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))

;;; magic latex buffer
(use-package magic-latex-buffer
  :hook
  (latex-mode . magic-latex-buffer))

(provide 'init-latex)
;;; init-latex.el ends here
