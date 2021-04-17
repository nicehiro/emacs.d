;;; -*- lexical-binding: t -*-

(setenv "PATH" (concat "/Library/TeX/texbin:" (getenv "PATH")))
(setq exec-path (append '("/Library/TeX/texbin") exec-path))

;;; org mode latex export setting
(setq org-format-latex-options (plist-put org-format-latex-options :scale 1.8))


;;; auctex support in emacs
;;; for some reason, you cannot use auctex to install directly
;;; https://github.com/jwiegley/use-package/issues/379
(use-package tex
	:defer t
	:ensure auctex
	:config
	;; Make parse file right
	(setq TeX-auto-save t)
	(setq TeX-parse-self t)
	(setq-default TeX-master nil)
	;; change tex engine to xetex
	(setq TeX-engine 'xetex)
	)

(use-package auctex-latexmk
	:ensure t
	:config
	(auctex-latexmk-setup)
	(setq auctex-latexmk-inherit-TeX-PDF-mode t))

;; managing cross references, bibliographies, indices, document navigation
(use-package reftex
	:ensure t
	:defer t
	:config
	(setq reftex-cite-prompt-optional-args t))

(use-package auto-dictionary
	:ensure t
	:init
	(add-hook 'flyspell-mode-hook (lambda () (auto-dictionary-mode 1))))

(use-package company-auctex
	:ensure t
	:init
	(company-auctex-init))



(add-hook 'TeX-mode-hook 'flyspell-mode)
(add-hook 'TeX-mode-hook (lambda () (TeX-fold-mode 1)))
(add-hook 'TeX-mode-hook 'LaTeX-math-mode)

;;; Magic latex buffer
(use-package magic-latex-buffer
	:hook
	(latex-mode . magic-latex-buffer))

(provide 'init-latex)
;;; init-latex.el ends here
