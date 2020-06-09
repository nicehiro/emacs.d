;;; -*- lexical-binding: t -*-
;;; Look And Feels, themes & modeline & font

;;; Code:
;;; menu bar & tool bar & scoll bar
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;;; disable splash screen
(setq initial-buffer-choice t)

(set-frame-parameter nil 'alpha '(100 . 100))

;;; English & Chinese font setting
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Sarasa Mono font code: "-????-Sarasa Mono SC-semibold-italic-normal-*-*-*-*-*-m-0-iso10646-1" ;;
;; English Sarasa Mono SC 18.0 == Chinese Sarasa Mono SC 16.0					 ;;
;;												 ;;
;; Unifont "-PfEd-Unifont-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1"			 ;;
;; English Unifont 18.0 == Chinese Unifont 16.0							 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (setq hiro/font "-PfEd-Unifont-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1")
(setq hiro/font "-????-Sarasa Mono SC-semibold-italic-normal-*-*-*-*-*-m-0-iso10646-1")
(set-face-attribute
 'default nil
 :font (font-spec :name hiro/font
		  :bold 'normal
		  :slant 'normal
		  :size 18.0))
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font
   (frame-parameter nil 'font)
   charset
   (font-spec :name "-WQYF-WenQuanYi Micro Hei-normal-normal-normal-*-*-*-*-*-*-0-iso10646-1"
	      :weight 'bold
	      :slant 'normal
	      :size 16.0)))
;; cntest hahahahahaha
;; 中文   测试测试测试测试测试

;;; Load theme.
;; (progn
;;   (require 'joker-theme)
;;   (if hiro/dumped-load-path
;;       (enable-theme 'joker)
;;     (load-theme 'joker t)))
(use-package tron-legacy-theme
  :config
  (setq tron-legacy-theme-vivid-cursor t)
  (setq tron-legacy-theme-softer-bg t)
  (load-theme 'tron-legacy))

;;; Dark theme. It has too blight color in the night.
(use-package srcery-theme
  :ensure t
  :custom
  (srcery-org-height . nil))

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

(provide 'init-looks)
;;; init-looks.el ends here
