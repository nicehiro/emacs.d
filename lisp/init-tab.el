(use-package tldr
	)

(defun hiro/awesome-tab-hide-tab (x)
	"Awesome tab mode hide tab rule using `X'."
	(let ((name (format "%s" x)))
		(or
		 (string-prefix-p "*epc" name)
		 (string-prefix-p "*helm" name)
		 (string-prefix-p "*Compile-Log*" name)
		 (string-prefix-p "*lsp" name)
		 (string-prefix-p "*httpd*" name)
		 (string-prefix-p "*grep" name)
		 (string-prefix-p "*envrc" name)
		 (string-prefix-p "*Shell" name)
		 (string-prefix-p "*Org" name)
		 (string-prefix-p "*NOX" name)
		 (string-prefix-p "*Python" name)
		 (string-prefix-p "*pyright" name)
		 (string-prefix-p "*dap" name)
		 (string-prefix-p "*python" name)
		 (string-prefix-p "*Completions" name)
		 (string-prefix-p "*nox" name)
		 (string-prefix-p "*Backtrace" name)
		 (string-prefix-p "*elfeed" name)
		 (string-prefix-p "Aweshell" name)
		 (and (string-prefix-p "magit" name)
					(not (file-name-extension name)))
		 )))

(defun hiro/awesome-tab-buffer-groups ()
	"`hiro/awesome-tab-buffer-groups' control buffers' group rules.

Group awesome-tab with mode if buffer is derived from `dired-mode' `org-mode'.
All buffer name start with * will group to \"Emacs\".
Other buffer group by `awesome-tab-get-group-name' with project name."
	(list
	 (cond
		((or (string-equal "*" (substring (buffer-name) 0 1))
				 )
		 "Emacs")
		(t
		 (awesome-tab-get-group-name (current-buffer))))))

;;; awesome tab

(use-package awesome-tab
	:config
	(setq awesome-tab-hide-tab-function 'hiro/awesome-tab-hide-tab)
	(setq awesome-tab-buffer-groups-function 'hiro/awesome-tab-buffer-groups))



(provide 'init-tab)
;;; init-tab.el ends here
