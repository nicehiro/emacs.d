(use-package switch-window
	:bind
	(:map global-map
				("C-x o" . 'switch-window))
	:config
	(setq switch-window-shortcut-style 'qwerty)
	(setq switch-window-shortcut-appearance 'asciiart))

;; set blur background
(set-face-background 'default "mac:windowBackgroundColor")
(dolist (f (face-list)) (set-face-stipple f "alpha:60%"))
(setq face-remapping-alist (append face-remapping-alist '((default my/default-blurred))))
(defface my/default-blurred
	'((t :inherit 'default :stipple "alpha:60%"))
	"Like 'default but blurred."
	:group 'my)


;; Set initial frame size and position
;; (defun my/set-initial-frame ()
;;	(let* ((base-factor 0.70)
;;				 (a-width (* (display-pixel-width) base-factor))
;;				 (a-height (* (display-pixel-height) base-factor))
;;				 (a-left (truncate (/ (- (display-pixel-width) a-width) 2)))
;;				 (a-top (truncate (/ (- (display-pixel-height) a-height) 2))))
;;		(set-frame-position (selected-frame) a-left a-top)
;;		(set-frame-size (selected-frame) (truncate a-width)  (truncate a-height) t)))
(setq frame-resize-pixelwise t)
(set-frame-size (selected-frame) (truncate 1000) (truncate 1000) t)


(provide 'init-window)
;;; init-window.el ends here
