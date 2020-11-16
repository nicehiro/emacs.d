(use-package ace-window
	:bind
	(:map global-map
				("C-x o" . ace-window)))

(use-package all-the-icons)

(use-package awesome-tab
	:quelpa (awesome-tab :repo "manateelazycat/awesome-tab"
											 :fetcher github)
	:config
	(awesome-tab-mode t))

(setq ns-option-modifier "super")

(provide 'for-better-experience)
;;; for-better-experience.el ends here
