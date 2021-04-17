(use-package switch-window
	:bind
	(:map global-map
				("C-x o" . 'switch-window))
	:config
	(setq switch-window-shortcut-style 'qwerty)
	(setq switch-window-shortcut-appearance 'asciiart))

;; @purcell
(defun sanityinc/adjust-opacity (frame incr)
	"Adjust the background opacity of FRAME by increment INCR."
	(unless (display-graphic-p frame)
		(error "Cannot adjust opacity of this frame"))
	(let* ((oldalpha (or (frame-parameter frame 'alpha) 100))
				 (oldalpha (if (listp oldalpha) (car oldalpha) oldalpha))
				 (newalpha (+ incr oldalpha)))
		(when (and (<= frame-alpha-lower-limit newalpha) (>= 100 newalpha))
			(modify-frame-parameters frame (list (cons 'alpha newalpha))))))

(defun improve-opacity ()
	(interactive)
	(sanityinc/adjust-opacity nil -2))

(defun reduce-opacity ()
	(interactive)
	(sanityinc/adjust-opacity nil 2))

(defun restore-opacity ()
	(interactive)
	(modify-frame-parameters nil `((alpha . 100))))

(provide 'init-window)
;;; init-window.el ends here
