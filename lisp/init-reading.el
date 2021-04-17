;;; -*- lexical binding: t -*-
;;; Better reading experience for eww, dash-docs, nov, mu4e.
;;; epub books

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

(add-hook 'eww-mode-hook 'eww-toggle-fonts)

(defun remap-scroll-key ()
	"Remap iscroll keymap in evil mode."
	(if evil-mode
			(progn
				(local-set-key [remap evil-next-line] #'iscroll-next-line)
				(local-set-key [remap evil-previous-line] #'iscroll-previous-line))
		(local-set-key [remap evil-next-line] nil)
		(local-set-key [remap evil-previous-line] nil)))

;;; Don't work with evil
;;; smooth scroll image in emacs
;; (use-package iscroll
;;	:quelpa
;;	(iscroll :repo "casouri/iscroll" :fetcher github)
;;	:hook
;;	((org-mode . iscroll-mode)))

(add-hook 'iscroll-mode-hook #'remap-scroll-key)

(use-package shrface
	:defer t
	:config
	(shrface-basic)
	(shrface-trial)
	;; (shrface-default-keybindings) ; setup default keybindings
	(setq shrface-href-versatile t))

(use-package eww
	:defer t
	:init
	(add-hook 'eww-after-render-hook #'shrface-mode)
	:config
	(require 'shrface))

(use-package nov
	:defer t
	:init
	(add-hook 'nov-mode-hook #'shrface-mode)
	:config
	(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
	(require 'shrface)
	(setq nov-shr-rendering-functions
				'((img . nov-render-img) (title . nov-render-title)))
	(setq nov-shr-rendering-functions
				(append nov-shr-rendering-functions shr-external-rendering-functions)))

(set-face-attribute
 'variable-pitch nil
 :font (font-spec :name  "-*-PT Sans-bold-italic-normal-*-*-*-*-*-p-0-iso10646-1"
									:weight 'light
									:slant 'normal
									:size 18.0))


(provide 'init-reading)
;;; init-reading.el ends here
