;;; -*- lexical binding: t -*-
;;; Common configuration of program mode.

(show-paren-mode t)
;;; toggle truncate lines for program mode
(add-hook 'prog-mode-hook 'toggle-truncate-lines)
;;; display line numbers for program mode
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'prog-mode-hook (lambda () (setq tab-width 2)))

(add-hook 'prog-mode-hook
					(lambda () (setq line-spacing 0.5)))
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

(use-package format-all)

;; Don't prompte yes-or-no question
(setq enable-local-variables :all)

(use-package pyvenv)

(provide 'init-prog)
;;; init-prog.el ends here
