;;; evil configration. -*- lexical binding:t -*-
;;; Code:
(use-package evil
	:ensure t
	:init
	(setq evil-vsplit-window-right t)
	(setq evil-split-window-below t)
	:hook
	((prog-mode . evil-mode))
	:bind
	((:map evil-normal-state-map
				 ("s-1" . awesome-tab-select-visible-tab)
				 ("s-2" . awesome-tab-select-visible-tab)
				 ("s-3" . awesome-tab-select-visible-tab)
				 ("s-4" . awesome-tab-select-visible-tab)
				 ("s-5" . awesome-tab-select-visible-tab)
				 ("s-6" . awesome-tab-select-visible-tab)
				 ("s-7" . awesome-tab-select-visible-tab)
				 ("s-8" . awesome-tab-select-visible-tab)
				 ("s-9" . awesome-tab-select-visible-tab)
				 ))
	:config
	(setq ns-option-modifier 'super)
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
;;; init-edit.el ends here
