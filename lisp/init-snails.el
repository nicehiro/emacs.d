(use-package exec-path-from-shell
	:quelpa (exec-path-from-shell :repo "purcell/exec-path-from-shell"
																:fetcher github)
	:config
	(when (memq window-system '(mac ns x))
		(exec-path-from-shell-initialize)))

(add-to-list 'load-path "~/.emacs.d/quelpa/build/snails")
(require 'snails)
(evil-set-initial-state 'snails-mode 'emacs)
(evil-global-set-key 'normal
										 (kbd "SPC") 'snails)

(provide 'init-snails)
;;; init-snails.el ends here
