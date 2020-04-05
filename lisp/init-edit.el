;;; evil configration. -*- lexical binding:t -*-
;;; Code:
(use-package evil
  :commands evil-mode
  :init
  (add-hook 'prog-mode-hook #'evil-mode)
  (add-hook 'text-mode-hook #'evil-mode))

(use-package evil-surround
  :commands evil-surround-mode
  :init
  (add-hook 'prog-mode-hook #'evil-mode)
  (add-hook 'text-mode-hook #'evil-mode))

;;; store all backup and autosave files in the tmp dir
;;; copied from https://emacsredux.com/blog/2013/05/09/keep-backup-and-auto-save-files-out-of-the-way/
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(provide 'init-edit)
;;; init-evil.el ends here
