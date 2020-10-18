;;; -*- lexical-binding: t -*-

(setenv "PATH" (concat "/Library/TeX/texbin:" (getenv "PATH")))
(setq exec-path (append '("/Library/TeX/texbin") exec-path))

;; Use XeLaTeX to export PDF in Org-mode
(setq org-latex-pdf-process
			'("xelatex -interaction nonstopmode -output-directory %o %f"
	"xelatex -interaction nonstopmode -output-directory %o %f"
	"xelatex -interaction nonstopmode -output-directory %o %f"))

;;; org mode latex export setting
(setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))

(use-package cdlatex
	:hook
	(turn-on-cdlatex . LaTeX-mode))

(use-package tex-site
	:ensure auctex
	:mode ("\\.tex\\'" . latex-mode)
	:config
	(setq TeX-engine 'xetex)
	(setq TeX-auto-save t)
	(setq TeX-parse-self t))

(add-hook 'LaTeX-mode-hook
						(lambda ()
							;; (rainbow-delimiters-mode)
							(company-mode)
							;; (smartparens-mode)
							(turn-on-reftex)
							(setq reftex-plug-into-AUCTeX t)
							(reftex-isearch-minor-mode)
							(setq TeX-PDF-mode t)
							(display-line-numbers-mode)
							(setq TeX-source-correlate-method 'synctex)
							(setq TeX-source-correlate-start-server t)))

;;; Magic latex buffer
(use-package magic-latex-buffer
	:hook
	(latex-mode . magic-latex-buffer))

(provide 'init-latex)
;;; init-latex.el ends here
