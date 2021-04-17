;;; -*- lexcial binding: t -*-
;;; Emacs LSP configuration.

;; (use-package eglot)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (use-package nox																						 ;;
;;	:quelpa (nox :repo "manateelazycat/nox" :fetcher github)	 ;;
;;	:bind																											 ;;
;;	(("C-c d" . nox-show-doc))																 ;;
;;	(:map evil-normal-state-map																 ;;
;;				("M-RET" . xref-find-definitions))									 ;;
;;	)																													 ;;
;;																														 ;;
;; (dolist (hook (list																				 ;;
;;							 'js-mode-hook																 ;;
;;							 'rust-mode-hook															 ;;
;;							 'python-mode-hook														 ;;
;;							 'ruby-mode-hook															 ;;
;;							 'java-mode-hook															 ;;
;;							 'sh-mode-hook																 ;;
;;							 'php-mode-hook																 ;;
;;							 'c-mode-common-hook													 ;;
;;							 'c-mode-hook																	 ;;
;;							 'c++-mode-hook																 ;;
;;							 'haskell-mode-hook														 ;;
;;							 ))																						 ;;
;;	(add-hook hook '(lambda () (nox-ensure))))								 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package lsp-mode
	:init
	;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
	(setq lsp-keymap-prefix "C-c l")
	(setq lsp-enable-file-watchers nil)
	:hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
				 ;; if you want which-key integration
				 (lsp-mode . lsp-enable-which-key-integration))
	:commands lsp
	:config
	(lsp-headerline-breadcrumb-mode -1)
	(setq lsp-headerline-breadcrumb-enable nil)
	(setq lsp-headerline-breadcrumb-segments '(symbols))
	(setq gc-cons-threshold 100000000)
	(setq read-process-output-max (* 1024 1024)) ;; 1mb
	)

(use-package lsp-pyright
	:quelpa (lsp-pyright :repo "emacs-lsp/lsp-pyright" :fetcher github)
	:ensure t
	:hook (python-mode . (lambda ()
												 (require 'lsp-pyright)
												 (lsp))))

;; optionally
(use-package lsp-ui
	:commands lsp-ui-mode
	:config
	(define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
	(define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
	()
	(setq lsp-ui-doc-use-webkit nil)
	(setq lsp-ui-doc-use-childframe t)
	(setq lsp-ui-doc-max-width 200)
	)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; optionally if you want to use debugger
(use-package dap-mode
	:config
	(dap-mode 1)
	(dap-ui-mode 1)
	(dap-tooltip-mode 1)
	(dap-ui-controls-mode 1)
	(require 'dap-python))
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

(use-package consult-lsp
	:quelpa (consult-lsp :repo "gagbo/consult-lsp" :fetcher github)
	:config
	(define-key lsp-mode-map [remap xref-find-apropos] #'consult-lsp-symbols))

(provide 'init-lsp)
;;; init-lsp.el ends here
