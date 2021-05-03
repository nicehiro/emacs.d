(use-package consult
	;; Replace bindings. Lazily loaded due by `use-package'.
	:bind (;; C-c bindings (mode-specific-map)
				 ("C-c h" . consult-history)
				 ("C-c m" . consult-mode-command)
				 ("C-c b" . consult-bookmark)
				 ("C-c k" . consult-kmacro)
				 ;; C-x bindings (ctl-x-map)
				 ("C-x M-:" . consult-complex-command)     ;; orig. repeat-complet-command
				 ("C-x b" . consult-buffer)                ;; orig. switch-to-buffer
				 ("C-x 4 b" . consult-buffer-other-window) ;; orig. switch-to-buffer-other-window
				 ("C-x 5 b" . consult-buffer-other-frame)  ;; orig. switch-to-buffer-other-frame
				 ;; Custom M-# bindings for fast register access
				 ("M-#" . consult-register-load)
				 ("M-'" . consult-register-store)          ;; orig. abbrev-prefix-mark (UNRELATED!)
				 ("C-M-#" . consult-register)
				 ;; Other custom bindings
				 ("M-y" . consult-yank-pop)                ;; orig. yank-pop
				 ("<help> a" . consult-apropos)            ;; orig. apropos-command
				 ;; M-g bindings (goto-map)
				 ("M-g g" . consult-goto-line)             ;; orig. goto-line
				 ("M-g M-g" . consult-goto-line)           ;; orig. goto-line
				 ("M-g o" . consult-outline)
				 ("M-g m" . consult-mark)
				 ("M-g k" . consult-global-mark)
				 ("M-g i" . consult-project-imenu) ;; Alternative: consult-imenu
				 ("M-g e" . consult-error)
				 ;; M-s bindings (search-map)
				 ("M-s g" . consult-git-grep)              ;; alt. consult-grep, consult-ripgrep
				 ("M-s f" . consult-find)                  ;; alt. consult-locate, find-fd
				 ("M-s l" . consult-line)
				 ("M-s m" . consult-multi-occur)
				 ("M-s k" . consult-keep-lines)
				 ("M-s u" . consult-focus-lines)
				 ;; Replacement for isearch-edit-string
				 ("M-s e" . consult-isearch)
				 :map isearch-mode-map
				 ("M-e" . consult-isearch)                 ;; orig. isearch-edit-string
				 ("M-s e" . consult-isearch))              ;; orig. isearch-edit-string

	;; The :init configuration is always executed (Not lazy!)
	:init

	;; Custom command wrappers. It is generally encouraged to write your own
	;; commands based on the Consult commands. Some commands have arguments which
	;; allow tweaking. Furthermore global configuration variables can be set
	;; locally in a let-binding.
	(defun find-fd (&optional dir initial)
		(interactive "P")
		(let ((consult-find-command "fd --color=never --full-path ARG OPTS"))
			(consult-find dir initial)))

	;; Optionally configure the register formatting. This improves the register
	;; preview for `consult-register', `consult-register-load',
	;; `consult-register-store' and the Emacs built-ins.
	(setq register-preview-delay 0
				register-preview-function #'consult-register-format)
	;; Optionally tweak the register preview window.
	;; This adds stripes, sorting and hides the mode line of the window.
	(advice-add #'register-preview :override #'consult-register-window)

	;; Configure other variables and modes in the :config section,
	;; after lazily loading the package.
	:config

	;; Configure preview. Note that the preview-key can also be configured on a
	;; per-command basis via `consult-config'.
	;; The default value is 'any, such that any key triggers the preview.
	;; (setq consult-preview-key 'any)
	;; (setq consult-preview-key (kbd "M-p"))
	;; (setq consult-preview-key (list (kbd "<S-down>") (kbd "<S-up>")))

	;; Optionally configure narrowing key.
	;; Both < and C-+ work reasonably well.
	(setq consult-narrow-key "<") ;; (kbd "C-+")
	;; Optionally make narrowing help available in the minibuffer.
	;; Probably not needed if you are using which-key.
	;; (define-key consult-narrow-map (vconcat consult-narrow-key "?") #'consult-narrow-help)

	;; Optional configure additional sources for `consult-buffer',
	;; for example a view library like https://github.com/minad/bookmark-view/.
	;; (add-to-list 'consult-buffer-sources
	;;               (list ?v
	;;                    :name     "View"
	;;                    :category 'bookmark
	;;                    :face     'font-lock-keyword-face
	;;                    :open     #'bookmark-jump
	;;                    :items    #'bookmark-view-names)
	;;              'append)

	;; Optionally configure a function which returns the project root directory
	(autoload 'projectile-project-root "projectile")
	(setq consult-project-root-function #'projectile-project-root))

(provide 'init-consult)
;;; init-consult.el ends here
