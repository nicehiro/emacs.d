;;; proxy configration

(defun chunyang-toggle-url-proxy ()
	"Toggle proxy for the url.el library."
	(interactive)
	(cond
	 (url-proxy-services
		(message "Turn off URL proxy")
		(setq url-proxy-services nil))
	 (t
		(message "Turn on URL proxy")
		(setq url-proxy-services
					'(("http" . "localhost:1081")
						("https" . "localhost:1081")
						("no_proxy" . "0.0.0.0"))))))


(provide 'init-proxy)
;;; init-proxy.el ends here
