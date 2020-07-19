;;; -*- lexical binding: t -*-
;;; Common configuration of program mode.

;;; toggle truncate lines for program mode
(add-hook 'prog-mode-hook 'toggle-truncate-lines)
;;; display line numbers for program mode
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'prog-mode-hook 'set-tab-2)
(defun set-tab-2 ()
	(setq tab-width 2))

;;; indent guide
(use-package indent-guide
	:hook
	(prog-mode . indent-guide-mode)
	:custom
	(indent-guide-recursive t))

;;; flycheck
(use-package flycheck
	:hook
	(prog-mode . flycheck-mode))

;; highlight brackets
(show-paren-mode 1)

(add-hook 'prog-mode-hook 'electric-pair-mode)

(provide 'init-prog)
;;; init-prog.el ends here
