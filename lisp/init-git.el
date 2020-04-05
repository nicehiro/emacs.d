;;; -*- lexcial-binding -*-
;;; Magit for git.

(use-package magit
  :commands (magit-status)
  :bind
  ("C-M-G" . 'magit-status))

(use-package diff-hl
  :bind
  ("C-S-G" . 'diff-hl-mode))

(use-package gitignore-mode
  :hook (gitignore-mode . yas-minor-mode))

(provide 'init-git)
;;; init-git.el ends here
