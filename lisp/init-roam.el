(use-package org-roam
	:quelpa
	(org-roam :repo "org-roam/org-roam"
						:fetcher github)
	:hook
	(('after-init-hook 'org-roam-mode))
	:bind
	(:map org-roam-mode-map
				(("C-c n l" . org-roam)
				 ("C-c n f" . org-roam-find-file)
				 ("C-c n g" . org-roam-graph))
				:map org-mode-map
				(("C-c n i" . org-roam-insert))
				(("C-c n I" . org-roam-insert-immediate)))
	:config
	(setq org-roam-directory "~/org-roam")
	(setq org-roam-capture-templates
				'(
					("d" "default" plain (function org-roam-capture--get-point)
					 "%?"
					 :file-name "%<%Y%m%d%H%M%S>-${slug}"
					 :head "#+title: ${title}\n#+roam_alias:\n#+roam_tags:\n\n")
					("t" "Term" plain (function org-roam-capture--get-point)
					 "* Description:"
					 :file-name "%<%Y%m%d%H%M%S>-${slug}"
					 :head "#+title: ${title}\n#+filed: \n#+OPTIONS: toc:nil\n#+roam_alias:\n#+roam_tags: \n\n"
					 :unnarrowed t)
					("p" "Paper Note" plain (function org-roam-capture--get-point)
					 "* Related Works\n\n%?\n* Views\n\n* Methods\n\n* Experiments\n\n* Conclusion\n"
					 :file-name "%<%Y%m%d%H%M%S>-${slug}"
					 :head "#+title: ${title}\n#+roam_alias:\n#+roam_tags: \n\n"
					 :unnarrowed t
					 )
					("T" "Translated Post" plain (function org-roam-capture--get-point)
					 "#+begin_quote\n\n#+end_quote\n"
					 :file-name  "%<%Y%m%d%H%M%S>-${slug}"
					 :head "#+title: ${title}\n#+roam_alias:\n#+roam_tags: \n\n"
					 :unnarrwoed t
					 )
					))
	(setq org-roam-capture-immediate-template
			'("d" "default" plain (function org-roam-capture--get-point)
				"%?"
				:file-name "%<%Y%m%d%H%M%S>-${slug}"
				:head "#+title: ${title}\n"
				:unnarrowed t))
	)

(use-package org-roam-server
	:quelpa
	(org-roam-server :repo "org-roam/org-roam-server"
									 :fetcher github)
	:config
	(setq org-roam-server-host "127.0.0.1"
				org-roam-server-port 9090
				org-roam-server-export-inline-images t
				org-roam-server-authenticate nil
				org-roam-server-serve-files nil
				org-roam-server-served-file-extensions '("pdf" "mp4" "ogv")
				org-roam-server-network-poll t
				org-roam-server-network-arrows nil
				org-roam-server-network-label-truncate t
				org-roam-server-network-label-truncate-length 60
				org-roam-server-network-label-wrap-length 20
				)
	(org-roam-server-mode)
	(require 'org-roam-protocol)
	)

(defun my-org-protocol-focus-advice (orig &rest args)
	(x-focus-frame nil)
	(apply orig args))

(advice-add 'org-roam-protocol-open-ref :around
						#'my-org-protocol-focus-advice)
(advice-add 'org-roam-protocol-open-file :around
						#'my-org-protocol-focus-advice)

(provide 'init-roam)
;;; init-roam.el ends here
