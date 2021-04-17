(use-package page-break-lines)


(use-package dashboard
	:ensure t
	:config
	(dashboard-setup-startup-hook)
	(setq dashboard-banner-logo-title "Hello, Fangyuan! Happy Hacking Emacs & Emacs ♥ You.")
	(setq dashboard-banner-logo-png "~/.emacs.d/evil.xbm")
	(setq dashboard-center-content t)
	(setq dashboard-items '((recents . 5)
													(projects . 5)))
	(setq dashboard-set-heading-icons t)
	(setq dashboard-set-file-icons t)
	(setq dashboard-set-navigator t)
	;; Format: "(icon title help action face prefix suffix)"
	(setq dashboard-navigator-buttons
				`(;; line1
					((,(all-the-icons-octicon "mark-github" :height 1.1 :v-adjust 0.0)
						"Homepage"
						"Browse homepage"
						(lambda (&rest _) (browse-url "https://www.github.com/nicehiro")))
					 (,(all-the-icons-fileicon "org" :height 1.1 :v-adjust 0.0)
						"Blog"
						"Browse blog website"
						(lambda (&rest _) (browse-url "https://www.nicehiro.github.io"))))))
	)


(provide 'init-splash)
;;; init-splash.el ends here
