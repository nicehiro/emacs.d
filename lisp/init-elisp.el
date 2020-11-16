;;; -*- lexical-binding: t -*-
;;; Completion

(use-package elisp-docstring-server
	:quelpa
	(elisp-docstring-server :repo "xuchunyang/elisp-docstring-server.el"
													:fetcher github
													:files (:defaults "index.html"))
	)

(provide 'init-elisp)
;;; init-elisp.el ends here
