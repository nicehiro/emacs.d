;;; -*- lexcial binding: t -*-

;;; show key map in current buffer
(use-package which-key
	:ensure t
	:config
	(which-key-mode t)
	(which-key-setup-side-window-right-bottom))

;;; Default mac keybindings.
(when (eq system-type 'darwin)
	(setq mac-option-modifier nil
				ns-function-modifier 'super
				mac-right-command-modifier 'hyper
				mac-right-option-modifier 'alt
				mac-command-modifier 'meta))

(provide 'init-key)
;;; init-key.el ends here
