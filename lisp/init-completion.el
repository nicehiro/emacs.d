;; Enable vertico
(use-package vertico
	:init
	(vertico-mode)
	:config
	(setq completion-styles '(substring orderless))
	(advice-add #'vertico--setup :after
							(lambda (&rest _)
								(setq-local completion-auto-help nil
														completion-show-inline-help nil))))


;; Use the `orderless' completion style.
;; Enable `partial-completion' for files to allow path expansion.
;; You may prefer to use `initials' instead of `partial-completion'.
(use-package orderless
	:init
	(setq completion-styles '(orderless)
				completion-category-defaults nil
				completion-category-overrides '((file (styles . (partial-completion))))))

;; Persist history over Emacs restarts. Vertico sorts by history.
(use-package savehist
	:init
	(savehist-mode))

;; A few more useful configurations...
(use-package emacs
	:init
	;; Add prompt indicator to `completing-read-multiple'.
	(defun crm-indicator (args)
		(cons (concat "[CRM] " (car args)) (cdr args)))
	(advice-add #'completing-read-multiple :filter-args #'crm-indicator)

	;; Grow and shrink minibuffer
	;;(setq resize-mini-windows t)

	;; Do not allow the cursor in the minibuffer prompt
	(setq minibuffer-prompt-properties
				'(read-only t cursor-intangible t face minibuffer-prompt))
	(add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

	;; Enable recursive minibuffers
	(setq enable-recursive-minibuffers t)
	;; TAB cycle if there are only few candidates
	(setq completion-cycle-threshold 3)

	;; Enable indentation+completion using the TAB key.
	;; Completion is often bound to M-TAB.
	(setq tab-always-indent 'complete)
	)

(use-package marginalia
	;; Either bind `marginalia-cycle` globally or only in the minibuffer
	:bind (:map minibuffer-local-map
							("M-A" . marginalia-cycle))

	;; The :init configuration is always executed (Not lazy!)
	:init

	;; Must be in the :init section of use-package such that the mode gets
	;; enabled right away. Note that this forces loading the package.
	(marginalia-mode)

	;; When using Selectrum, ensure that Selectrum is refreshed when cycling annotations.
	(advice-add #'marginalia-cycle :after
							(lambda () (when (bound-and-true-p selectrum-mode) (selectrum-exhibit))))

	;; Prefer richer, more heavy, annotations over the lighter default variant.
	;; E.g. M-x will show the documentation string additional to the keybinding.
	;; By default only the keybinding is shown as annotation.
	;; Note that there is the command `marginalia-cycle' to
	;; switch between the annotators.
	(setq marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
	)

;; Configure corfu
(use-package corfu
	;; Optionally use TAB for cycling, default is `corfu-complete'.
	;; :bind (:map corfu-map
	;;        ("TAB" . corfu-next)
	;;        ("S-TAB" . corfu-previous))

	;; You may want to enable Corfu only for certain modes.
	;; :hook ((prog-mode . corfu-mode)
	;;        (shell-mode . corfu-mode)
	;;        (eshell-mode . corfu-mode))

	:config

	;; Alternatively enable Corfu globally.
	;; This is recommended if Corfu is used with dabbrev.
	(corfu-global-mode)

	;; Optionally enable cycling for `corfu-next' and `corfu-previous'.
	;; (setq corfu-cycle t)
	)

;; Dabbrev works with Corfu
(use-package dabbrev
	;; Swap M-/ and C-M-/
	:bind (("M-/" . dabbrev-completion)
				 ("C-M-/" . dabbrev-expand)))


(provide 'init-completion)
