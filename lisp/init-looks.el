;;; -*- lexical-binding: t -*-
;;; Look And Feels, themes & modeline & font

;;; Code:
;;; menu bar & tool bar & scoll bar
(tool-bar-mode -1)
(when (not (eq system-type 'darwin))
	(menu-bar-mode -1))
(scroll-bar-mode -1)

;;; disable splash screen
(setq initial-buffer-choice t)

(set-frame-parameter nil 'alpha '(100 . 100))

;;; English & Chinese font setting
(setq hiro/font "-*-Hack-normal-normal-normal-*-*-*-*-*-p-0-iso10646-1")
(setq hiro/chinese-font "-*-PingFang SC-normal-normal-normal-*-*-*-*-*-p-0-iso10646-1")
(set-face-attribute
 'default nil
 :font (font-spec :name hiro/font
									:weight 'normal
									:slant 'normal
									:size 14.0))
(dolist (charset '(kana han symbol cjk-misc bopomofo))
	(set-fontset-font
	 (frame-parameter nil 'font)
	 charset
	 (font-spec :name hiro/chinese-font
							:weight 'normal
							:slant 'normal
							:size 14.0)))

;; 中文
;; Test

;;; Load theme.
(progn
	(require 'joker-theme)
	(if hiro/dumped-load-path
			(enable-theme 'joker)
	))

(use-package tron-legacy-theme
	:config
	(setq tron-legacy-theme-vivid-cursor t)
	(setq tron-legacy-theme-softer-bg t)
	)

(use-package nord-theme
	:config
	(setq nord-comment-brightness 15)
	)

(use-package color-theme-sanityinc-tomorrow
	:config
	)

(use-package tao-theme
	:config
	(setq tao-theme-use-boxes nil)
	)

(use-package solarized-theme)

(use-package foggy-night-theme
	:quelpa (foggy-night-theme :repo "mswift42/foggy-night-theme"
														 :fetcher github))

;; (load-theme 'foggy-night t))
(add-to-list 'load-path "~/Projects/hiro-themes/")
(require 'hiro-emacs-light-theme)
(require 'hiro-emacs-dark-theme)
(load-theme 'hiro-emacs-dark t)

;;; Title bar settings.
(setq-default frame-title-format
				'(" %b%* %e <%m>"))

;;; Modeline settings.
;;; mini-modeline
(defun hiro/simple-modeline-render (left right)
	"Return a string of `window-width' length containing LEFT and RIGHT aligned respectively."
	(let* ((available-width (- (window-width) (length left) 1)))
		(format (format "%%s %%%ds " available-width) left right)))

(setq hiro/mini-modeline t)

(defun hiro/mode-base-info (format-string)
	"Return formatted string FORMAT-STRING if there's still enough space."
	(let ((s (format-mode-line format-string)))
		(when (or (not mini-modeline--msg)
				(> (window-width) (+ 12 (string-width s) (string-width mini-modeline--msg))))
			s)))

(defun hiro/mode-evil-info ()
	"Return formatted string of current evil state."
	(let ((current-state (symbol-name (symbol-value 'evil-state))))
		(setq s (format " [%s] " (upcase current-state)))
		(propertize s 'face '(:foreground "#bb99ff" :weight bold))))


;;; Mini-modeline right string format.
(setq mini-modeline-r-format '((:eval (hiro/mode-base-info '("%l:%c %b %* %m" (vc-mode vc-mode))))
						 " ["
						 (:eval (number-to-string (point)))
						 "] "
						 (:eval (when (featurep 'rime) (rime-lighter)))))
;;; Mini-modeline left string format.
(setq mini-modeline-l-format '((:eval (hiro/mode-evil-info))
						 " "
						 (:eval (mini-modeline-msg))))

;; (defface mini-modeline-mode-line
;;	'((((background light))
;;		 :background "#55ced1" :height 0.1 :box nil)
;;		(t
;; )))

(mini-modeline-mode t)

;;; Rainbow-mode for display current color code
(use-package rainbow-mode
	:hook
	((prog-mode . rainbow-mode)
	 (text-mode . rainbow-mode))
	)

;; posframe customization
(setq posframe-arghandler #'hiro-posframe-arghandler)
(defun hiro-posframe-arghandler (buffer-or-name arg-name value)
	(let ((info '(:internal-border-width 10 :background-color "#333030")))
		(or (plist-get info arg-name) value)))

(provide 'init-looks)
;;; init-looks.el ends here
