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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Sarasa Mono font code: "-????-Sarasa Mono SC-semibold-italic-normal-*-*-*-*-*-0-0-iso10646-1" ;;
;; English Sarasa Mono SC 18.0 == Chinese Sarasa Mono SC 16.0					 ;;
;;												 ;;
;; Unifont "-PfEd-Unifont-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1"			 ;;
;; English Unifont 18.0 == Chinese Unifont 16.0							 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (setq hiro/font "-PfEd-Unifont-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1")
;; (setq hiro/font "-????-Sarasa Mono Slab SC-normal-normal-normal-*-24-*-*-*-*-0-iso10646-1")
;; (setq hiro/font "-*-Menlo-normal-normal-normal-*-12-*-*-*-m-0-iso10646-1")
(setq hiro/font-bopomofo "-*-Libian SC-normal-normal-normal-*-*-*-*-*-p-0-iso10646-1")
(setq hiro/font "-*-Fira Code-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1")
(set-face-attribute
 'default nil
 :font (font-spec :name hiro/font
									:size 20.0))

(dolist (charset '(kana han symbol cjk-misc bopomofo))
	(set-fontset-font
	 (frame-parameter nil 'font)
	 charset
	 (font-spec :name hiro/font-bopomofo
							:weight 'bold
							:slant 'normal
							:size 24.0)))

;; cntest hahahahahaha
;; 中文   测试测试测试测试测试

;;; Load theme.
(progn
	(require 'joker-theme)
	(if hiro/dumped-load-path
			(enable-theme 'joker)
		;; (load-theme 'joker t))
	)

(progn
	(require 'elegant-light-theme)
	(if hiro/dumped-load-path
			(enable-theme 'elegant-light-theme)
		(load-theme 'elegant-emacs-light t))
	)

(use-package tron-legacy-theme
	:config
	(setq tron-legacy-theme-vivid-cursor t)
	(setq tron-legacy-theme-softer-bg t)
	;; (load-theme 'tron-legacy)
	)

(use-package nord-theme
	:config
	(setq nord-comment-brightness 15)
	)

;;; Dark theme. It has too blight color in the night.
(use-package srcery-theme
	:ensure t
	:custom
	(srcery-org-height . nil))

(use-package color-theme-sanityinc-tomorrow
	:config
	;; (load-theme 'sanityinc-tomorrow-night)
	)

(use-package tao-theme
	:config
	(setq tao-theme-use-boxes nil)
	;; (load-theme 'tao-yang)
	)

(use-package solarized-theme)

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

(defface mini-modeline-mode-line
	'((((background light))
		 :background "#55ced1" :height 0.1 :box nil)
		(t
		 :background "#008b8b" :height 0.1 :box nil))
	"Modeline face for active window."
	:group 'mini-modeline)

(defface mini-modeline-mode-line-inactive
	'((((background light))
		 :background "#dddddd" :height 0.1 :box nil)
		(t
		 :background "#333333" :height 0.1 :box nil))
	"Modeline face for inactive window."
	:group 'mini-modeline)

(use-package mini-modeline
	:quelpa (mini-modeline :repo "kiennq/emacs-mini-modeline" :fetcher github)
	:ensure t
	:custom
	(mini-modeline-enhance-visual nil)
	(mini-modelineecho-duration 2)
	(mini-modeline-mode t))

(defun hiro/toggle-window-divider-and-border ()
	"Toggle window divider and border."
	(unless (string-match-p ".*-posframe\\*" (buffer-name (current-buffer)))
		(if (> (count-windows) 1)
	(progn
		(window-divider-mode 1))
			(progn
	(window-divider-mode -1)))))

;; Only show window divider when there's more than one window.
(add-hook 'window-configuration-change-hook #'hiro/toggle-window-divider-and-border)

(use-package theme-changer
	:quelpa (theme-changer :repo "hadronzoo/theme-changer" :fetcher github)
	:custom
	(calendar-latitude 300.21)
	(calendar-longitude 120.20)
	)

;; (change-theme 'solarized-light 'solarized-dark)

(provide 'init-looks)
;;; init-looks.el ends here
