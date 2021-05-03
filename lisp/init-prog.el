;;; -*- lexical binding: t -*-
;;; Common configuration of program mode.

(show-paren-mode t)
;;; toggle truncate lines for program mode
(add-hook 'prog-mode-hook 'toggle-truncate-lines)
;;; display line numbers for program mode
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
;; (add-hook 'prog-mode-hook 'linum-mode)
(add-hook 'prog-mode-hook (lambda () (setq tab-width 2)))

;; (add-hook 'prog-mode-hook
;;					(lambda () (setq line-spacing 0.1)))
;; (remove-hook 'prog-mode-hook (lambda () (setq line-spacing 0.2)))
(defun set-tab-2 ()
	(setq tab-width 2))

;;; indent guide
(use-package indent-guide
	:hook
	(prog-mode . indent-guide-mode)
	:custom
	(indent-guide-recursive t))

(use-package flycheck
	:hook
	((prog-mode . flycheck-mode)))

;; highlight brackets
(show-paren-mode 1)

(add-hook 'prog-mode-hook 'electric-pair-mode)

;; Don't prompte yes-or-no question
(setq enable-local-variables :all)

;; imenu-list
(use-package imenu-list
	:quelpa
	(imenu-list :repo "bmag/imenu-list"
							:fetcher github)
	:config
	;; (imenu-list-minor-mode)
	(setq imenu-list-focus-after-activation t)
	(setq imenu-list-auto-resize t))

;;; Rainbow delimiters for prog mode
(use-package rainbow-delimiters
	:hook
	((prog-mode . rainbow-delimiters-mode)))

;;; auto format
(use-package aggressive-indent
	:hook
	((emacs-lisp-mode . aggressive-indent-mode)
	 (css-mode . aggressive-indent-mode))
	)

;;; hungry delete spaces
(use-package hungry-delete
	:config
	(setq hungry-delete-join-reluctantly t)
	(global-hungry-delete-mode))


(provide 'init-prog)
;;; init-prog.el ends here
