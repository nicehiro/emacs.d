;;; -*- lexical-binding: t -*-
;;; search

(use-package ivy
	:ensure t
	:bind
	(("M-z" . 'ivy-resume)
	 ("C-s" . 'swiper)
	 :map ivy-switch-buffer-map
	 ("!" . 'ivy-switch-buffer-kill)
	 :map ivy-minibuffer-map
	 ("<escape>" . 'keyboard-escape-quit)
	 ("C-u" . 'keyboard-escape-quit)
	 ("{" . 'ivy-previous-line)
	 ("}" . 'ivy-next-line)
	 ("[" . 'ivy-previous-history-element)
	 ("]" . 'ivy-next-history-element)
	 ("<M-return>" . 'ivy-occur)
	 ("<mouse-3>". 'ivy-done)
	 :map ivy-occur-grep-mode-map
	 ("n" . 'ivy-occur-next-line)
	 ("p" . 'ivy-occur-previous-line))
	:init
	(setq ivy-use-virtual-buffers nil
			ivy-use-selectable-prompt t
	ivy-height 15)
	(ivy-mode 1))

(use-package counsel
	:bind
	;; for better M-x, show hot key behind the command.
	("M-x" . 'counsel-M-x)
	("C-x C-f" . 'counsel-find-file)
	("<C-escape>" . 'counsel-switch-buffer)
	("C-? C-f" . 'counsel-describe-function)
	("C-x C-@" . 'counsel-register)
	("C-x C-h" . 'counsel-imenu)
	("C-x C-b" . 'counsel-ibuffer)
	("M-y" . 'counsel-yank-pop))

(use-package counsel-projectile
	:init
	(counsel-projectile-mode 1))

(set-face-attribute 'ivy-minibuffer-match-face-1 nil
										:background "#333030")

(set-face-attribute 'ivy-minibuffer-match-face-2 nil
										:background "#1a464d")

(set-face-attribute 'ivy-minibuffer-match-face-3 nil
										:background "#1a464d")

(set-face-attribute 'ivy-minibuffer-match-face-4 nil
										:background "#1a464d")

(provide 'init-ivy)
;;; init-ivy.el ends here
