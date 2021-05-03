(add-to-list 'exec-path "/usr/local/Cellar/pandoc/2.9.2.1/bin")

(defvar hiro/dumped-load-path nil
	"Not nil when using dump.")


(when hiro/dumped-load-path
	;; Restore load path
	(setq load-path hiro/dumped-load-path)
	;; Disable error message
	(setq warning-minimum-level :emergency)
	(global-font-lock-mode t)
	(transient-mark-mode t))

(unless hiro/dumped-load-path
	;; load path for user config
	(setq hiro/init-file (or load-file-name (buffer-file-name)))
	(setq hiro/emacs-dir (file-name-directory hiro/init-file))
	(add-to-list 'load-path (concat hiro/emacs-dir "lisp/")) ;; Package & use-package & quelpa & melpa initialize
	(require 'package)
	(setq package-archives
				'(("gnu" . "http://elpa.emacs-china.org/gnu/")
					("melpa" . "http://elpa.emacs-china.org/melpa/")
					("melpa-stable" . "http://elpa.emacs-china.org/melpa-stable/")))
	(package-initialize)
	(setq package-selected-packages
				'(use-package quelpa-use-package))
	(unless package-archive-contents
		(package-refresh-contents))
	(dolist (package package-selected-packages)
		(when (and (assq package package-archive-contents)
							 (not (package-installed-p package)))
			(package-install package t)))
	(setq quelpa-checkout-melpa-p nil)
	(setq quelpa-update-melpa-p nil)
	(setq use-package-always-demand t)
	(setq use-package-always-ensure t)
	(require 'use-package)
	(require 'quelpa-use-package)
	(quelpa-use-package-activate-advice)
	;; Modules
	(require 'highlight-80+)
	(require 'init-company)
	(require 'init-edit)
	(require 'init-rime)
	(require 'init-org)
	(require 'init-latex)
	(require 'init-python)
	(require 'init-prog)
	(require 'init-blog)
	;; (require 'init-ivy)
	;; (require 'init-selectrum)
	(require 'init-completion)
	(require 'init-consult)
	(require 'init-git)
	(require 'init-translate)
	(require 'init-reading)
	(require 'init-key)
	(require 'init-web)
	(require 'init-ledger)
	(require 'init-languages)
	;; mac port emacs don't support this well
	(require 'init-roam)
	(require 'init-looks)
	(require 'init-modeline)
	(require 'init-theme)
	(require 'init-shell)
	(require 'init-lsp)
	(require 'init-window)
	(require 'init-sidebar)
	(require 'init-yas)
	(require 'init-feed)
	(require 'init-splash)
	(require 'init-tab)
	;; (require 'init-minibuffer)
	(require 'init-music)
	)

;; (load-theme 'elegant-emacs-light)
(toggle-debug-on-error t)

;;; Proper GC.
(setq gc-cons-threshold (* 1024 128))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
	 '("06781e3393389b135679f00531433e6a1da846b46bc4d8f3da0808db3831abec" "143d68cacc9e0f9d61867422899dc2ccb1f6508c64e7ac6d2fbf1ea835609b84" default))
 '(debug-on-error t)
 '(package-selected-packages '(corfu use-package quelpa-use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
