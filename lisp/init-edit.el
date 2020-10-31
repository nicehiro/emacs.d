;;; evil configration. -*- lexical binding:t -*-
;;; Code:
(use-package evil
	:ensure t
	:init
	(setq evil-vsplit-window-right t)
	(setq evil-split-window-below t)
	:hook
	((prog-mode . evil-mode))
	)

(use-package evil-surround
	)

;;; store all backup and autosave files in the tmp dir
;;; copied from https://emacsredux.com/blog/2013/05/09/keep-backup-and-auto-save-files-out-of-the-way/
(setq backup-directory-alist
			`((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
			`((".*" ,temporary-file-directory t)))

;;; useless whitespace
(setq show-trailing-whitespace t)
(add-hook 'before-save-hook 'whitespace-cleanup)

(provide 'init-edit)
;;; init-evil.el ends here
