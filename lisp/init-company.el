;;; -*- lexical-binding: t -*-
;;; Completion

;;; auto complete pairs
(electric-pair-mode 1)

(use-package company
	:bind
	(
	 :map
	 company-active-map
	 ("}" . 'company-select-next)
	 ("{" . 'company-select-previous)
	 ("<tab>" . 'company-complete-selection)
	 ("TAB" . 'company-complete-selection)
	 ("RET")
	 ("<return>")
	 ("SPC")
	 :map
	 company-template-nav-map
	 ("RET" . 'company-template-forward-field)
	 ("<return>" . 'company-template-forward-field)
	 ("TAB")
	 ("<tab>"))
	:init (require 'company-template)
	:hook
	((prog-mode . company-mode)
	 (conf-mode . company-mode)
	 (eshell-mode . company-mode))
	:custom
	(company-tng-configure-default)
	(company-frontends '(company-tng-frontend
					 company-pseudo-tooltip-frontend
					 company-echo-metadata-frontend))
	(company-backends
	 '(company-capf company-files company-css
			(company-dabbrev-code company-gtags company-etags company-keywords)
			company-dabbrev))
	(company-idle-delay 0.1)
	(company-minimum-prefix-length 3)
	(company-dabbrev-downcase nil)
	(company-abort-manual-when-too-short t)
	(company-require-match nil)
	(company-global-modes '(not dired-mode dired-sidebar-mode))
	)

(set-face-attribute 'company-tooltip nil
										:background "#525252"
										:foreground "#8ac6d1")

(set-face-attribute 'company-tooltip-selection nil
										:foreground "#a39391")

(set-face-attribute 'company-scrollbar-bg nil
										:background "#525252")

(set-face-attribute 'company-tooltip-common nil
										:foreground "#e79686")

(set-face-attribute 'company-scrollbar-fg nil
										:foreground "#e79686")



(provide 'init-company)
;;; init-company.el ends here
