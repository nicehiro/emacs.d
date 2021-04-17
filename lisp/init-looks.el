;;; -*- lexical-binding: t -*-
;;; Look And Feels, themes & modeline & font

;;; Code:
;;; menu bar & tool bar & scoll bar
(tool-bar-mode -1)
(when (not (eq system-type 'darwin))
	(menu-bar-mode -1))
(scroll-bar-mode -1)
(fringe-mode -1)
;; mac port maximized mode minibuffer too small
;; (toggle-frame-maximized)

;;; emacs frame margin
(let ((margin 4))
	(add-to-list 'default-frame-alist (cons 'internal-border-width margin))
	(set-frame-parameter nil 'internal-border-width margin))

;;; disable splash screen
(setq initial-buffer-choice t)

;;; no opacity
(set-frame-parameter nil 'alpha '(100 . 100))


;; English & Chinese font setting
;; 中文 中文中文
;; Test ffff
(set-face-attribute
 'default nil
 :font (font-spec :name  "-*-Victor Mono-bold-italic-normal-*-*-*-*-*-m-0-iso10646-1"
									:weight 'semibold
									:slant 'normal
									:size 18.0))
(dolist (charset '(kana han symbol cjk-misc bopomofo))
	(set-fontset-font
	 (frame-parameter nil 'font)
	 charset
	 (font-spec :name  "-*-PingFang SC-normal-normal-normal-*-*-*-*-*-p-0-iso10646-1"
							:weight 'normal
							:slant 'normal
							:size 18.0)))

;;; Title bar settings.
(setq-default frame-title-format
							'(" %b%* %e <%m>"))

;;; Rainbow-mode for display current color code
(use-package rainbow-mode
	:hook
	((prog-mode . rainbow-mode)
	 (text-mode . rainbow-mode))
	)

;; posframe customization
(setq posframe-arghandler #'hiro-posframe-arghandler)
(defun hiro-posframe-arghandler (buffer-or-name arg-name value)
	(let ((info `(:internal-border-width 10
																			 :background ,(frame-parameter nil 'background-color)
																			 :foreground ,(frame-parameter nil 'foreground-color))))
		(or (plist-get info arg-name) value)))

(use-package all-the-icons)

;; initial buffer text
(let ((filename "~/.emacs.d/startup.txt"))
	(when (file-exists-p filename)
		(setq initial-buffer-choice filename)))

;;; all-the-icons in dired
(use-package all-the-icons-dired
	:hook
	((dired-mode . all-the-icons-dired-mode)))

(provide 'init-looks)
;;; init-looks.el ends here
