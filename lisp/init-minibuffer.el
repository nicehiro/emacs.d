;;; config mini buffer
(use-package mini-frame
	:quelpa (mini-frame :repo "muffinmad/emacs-mini-frame" :fetcher github)
	:config
	(custom-set-variables
	 '(mini-frame-show-parameters
		 '((top . 100)
			 (width . 0.7)
			 (left . 0.5))))
	(mini-frame-mode)
	)

(provide 'init-minibuffer)
;; init-minibuffer.el ends here
