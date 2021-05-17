;;; -*- lexical-binding: t -*-
;;; Rime input method.

(defun hiro/rime-predicate-is-back-quote-or-tilde ()
	(or (equal rime--current-input-key ?`)
			(equal rime--current-input-key ?~)))

(use-package posframe)

(use-package rime
	:bind
	(:map
	 rime-active-mode-map
	 ("M-j" . 'rime-inline-ascii)
	 :map rime-mode-map
	 ("C-$" . 'rime-send-keybinding)
	 ("M-j" . 'rime-force-enable)
	 ("C-\\" . 'toggle-input-method))
	:custom
	(
	 (rime-librime-root "~/.emacs.d/librime/dist/")
	 (rime-emacs-module-header-root "/Applications/Emacs.app/Contents/Resources/include/")
	 (rime-translate-keybindings '("C-f" "C-b" "C-n" "C-p" "C-g"))
	 (default-input-method "rime")
	 (rime-cursor "˰")
	 (rime-show-candidate 'posframe)
	 (rime-posframe-style 'vertical)
	 (rime-posframe-properties (list :background-color (frame-parameter nil 'background-color)
																	 :foreground-color (frame-parameter nil 'foreground-color)))
	 (rime-disable-predicates '(rime-predicate-evil-mode-p
															rime-predicate-after-alphabet-char-p
															rime-predicate-prog-in-code-p
															rime-predicate-tex-math-or-command-p
															rime-predicate-current-uppercase-letter-p
															rime-predicate-ace-window-p
															rime-predicate-after-ascii-char-p))
	 ))

(use-package rime
	:custom
	(default-input-method "rime"))


(provide 'init-rime)
;;; init-rime.el ends here
