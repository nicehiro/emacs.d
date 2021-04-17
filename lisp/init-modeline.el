;;; modeline settings
(defun +simple-mode-line-render (left right)
	"Return a string of `window-width' length containing LEFT, and RIGHT
 aligned respectively."
	(let* ((available-width (- (window-width) (length left) 2)))
		(format (format " %%s %%%ds " available-width) left right)))

(defun modeline-evil-info ()
	"Return formatted string of current evil state."
	(let ((current-state (symbol-name (symbol-value 'evil-state))))
		(setq s (format " [%s] " (upcase current-state)))
		(propertize s 'face '(:weight bold))))

(defun modeline-base-info (format-string)
	"Return formatted string FORMAT-STRING if there's still enough space."
	(let ((s (format-mode-line format-string)))
		s))

;; modeline setting
(setq-default mode-line-format
							'((:eval
								 (+simple-mode-line-render
									;; left
									(format-mode-line
									 '((:eval (modeline-evil-info))
										 " %l:%C "
										 (:eval (when (bound-and-true-p rime-mode) (concat rime-title " ")))
										 (:eval (when (bound-and-true-p flycheck-mode) flycheck-mode-line))))
									;; right
									(format-mode-line
									 '((:eval (modeline-base-info '("%b %* %m " (vc-mode vc-mode) "  ")))
										 ))))))


(provide 'init-modeline)
;;; init-modeline.el ends here
