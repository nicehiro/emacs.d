;;; evil configration. -*- lexical binding:t -*-
;;; Code:
(use-package evil
	:ensure t
	:init
	(setq evil-vsplit-window-right t)
	(setq evil-split-window-below t)
	:hook
	((prog-mode . evil-mode))
	:config
	(setq ns-option-modifier 'super)
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

;; source: http://steve.yegge.googlepages.com/my-dot-emacs-file
(defun rename-file-and-buffer (new-name)
	"Renames both current buffer and file it's visiting to NEW-NAME."
	(interactive "sNew name: ")
	(let ((name (buffer-name))
				(filename (buffer-file-name)))
		(if (not filename)
				(message "Buffer '%s' is not visiting a file!" name)
			(if (get-buffer new-name)
					(message "A buffer named '%s' already exists!" new-name)
				(progn
					(rename-file filename new-name 1)
					(rename-buffer new-name)
					(set-visited-file-name new-name)
					(set-buffer-modified-p nil))))))

;;; auto refresh buffer
(global-auto-revert-mode 1)

(add-hook 'text-mode-hook '(lambda () (highlight-80+-mode)))
(add-hook 'prog-mode-hook '(lambda () (highlight-80+-mode)))


(provide 'init-edit)
;;; init-edit.el ends here
