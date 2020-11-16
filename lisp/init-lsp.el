;;; -*- lexcial binding: t -*-
;;; Emacs LSP configuration.

;; (use-package eglot)
(use-package nox
	:quelpa (nox :repo "manateelazycat/nox" :fetcher github)
	:bind
	(("C-c d" . nox-show-doc))
	(:map evil-normal-state-map
				("M-RET" . xref-find-definitions))
	)

(dolist (hook (list
		 'js-mode-hook
		 'rust-mode-hook
		 'python-mode-hook
		 'ruby-mode-hook
		 'java-mode-hook
		 'sh-mode-hook
		 'php-mode-hook
		 'c-mode-common-hook
		 'c-mode-hook
		 'c++-mode-hook
		 'haskell-mode-hook
		 ))
	(add-hook hook '(lambda () (nox-ensure))))

(provide 'init-lsp)
;;; init-lsp.el ends here
