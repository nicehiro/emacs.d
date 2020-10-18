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
	 (rime-translate-keybindings '("C-f" "C-b" "C-n" "C-p" "C-g"))
	 (default-input-method "rime")
	 (rime-cursor "˰")
	 (rime-librime-root "~/.emacs.d/librime/dist")
	 (rime-show-candidate 'posframe)
	 (rime-posframe-style 'vertical)))

(provide 'init-rime)
;;; init-rime.el ends here
