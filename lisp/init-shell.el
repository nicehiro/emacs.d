(use-package aweshell
	:quelpa (aweshell :repo "manateelazycat/aweshell"
										:fetcher github)
	:config
	(set-face-attribute 'epe-pipeline-host-face nil
											:foreground "#8ac6d1")

	(set-face-attribute 'epe-pipeline-user-face nil
											:foreground "#e79686")

	(set-face-attribute 'epe-pipeline-delimiter-face nil
											:foreground "#a39391")
	(set-face-attribute 'epe-dir-face nil
											:foreground "#525252")
	)


(provide 'init-shell)
;;; init-shell.el ends here
