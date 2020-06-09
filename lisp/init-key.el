;;; -*- lexcial binding: t -*-

;;; show key map in current buffer
(use-package which-key
  :ensure t
  :config
  (which-key-mode t)
  (which-key-setup-side-window-right-bottom))

(provide 'init-key)
;;; init-key.el ends here
