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
  ((rime-disable-predicates '(rime-predicate-prog-in-code-p
			      rime-predicate-evil-mode-p
			      rime-predicate-tex-math-or-command-p
			      rime-predicate-org-latex-mode-p
			      rime-predicate-after-alphabet-char-p))
   (rime-inline-predicates '(rime-predicate-space-after-cc-p
			     hiro/rime-predicate-is-back-quote-or-tilde
			     rime-predicate-current-uppercase-letter-p))
   (rime-translate-keybindings '("C-f" "C-b" "C-n" "C-p" "C-g"))
   (default-input-method "rime")
   (rime-cursor "˰")
   (rime-show-candidate 'posframe)))

(provide 'init-rime)
;;; init-rime.el ends here
