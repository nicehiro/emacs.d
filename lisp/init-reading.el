;;; -*- lexical binding: t -*-
;;; Better reading experience for eww, dash-docs, nov, mu4e.
;;; epub books
(use-package nov
  :custom
  (nov-text-width 80)
  (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode)))

(defun hiro/nov-font-setup ()
  "Novel font setting."
  (face-remap-add-relative 'variable-pitch :family "Liberation Serif"
					   :height 1.0))
(add-hook 'nov-mode-hook 'hiro/nov-font-setup)

;;; expand eww dash-docs novs mu4e to org-mode for better looks
(use-package shrface
  :after shr
  :quelpa
  (shrface :repo "chenyanming/shrface" :fetcher github)
  :custom
  (shrface-bullets-bullet-list '("◉" "○" "●" "✿" "◆" "◉"))
  (nov-shr-rendering-functions shr-external-rendering-functions))

;;; for code highlight
(use-package shr-tag-pre-highlight
  :ensure t
  :after shr
  :config
  (add-to-list 'shr-external-rendering-functions
	       '(pre . shr-tag-pre-highlight))
  (when (version< emacs-version "26")
    (with-eval-after-load 'eww
      (advice-add 'eww-display-html :around
		  'eww-display-html--override-shr-external-rendering-functions))))

(defun hiro/set-margins ()
  "Set margins for window display."
  (setq left-margin-width 10)
  (setq right-margin-width 10))

;; (add-hook 'text-mode-hook 'hiro/set-margins)
;; (add-hook 'eww-mode-hook 'hiro/set-margins)
;; (add-hook 'eww-mode-hook 'eww-toggle-fonts)

(use-package olivetti
  :hook
  (text-mode . olivetti-mode)
  (eww-mode . olivetti-mode))

(add-hook 'eww-mode-hook 'eww-toggle-fonts)


(provide 'init-reading)
;;; init-reading.el ends here
