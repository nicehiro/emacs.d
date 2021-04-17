(use-package yasnippet-snippets)

(use-package yasnippet
	:config
	(yas-global-mode 1))

(defun python-args-to-google-docstring (text &optional make-fields)
	"Return a reST docstring format for the python arguments `TEXT' in yas-text."
	(let* ((indent (concat "\n" (make-string (current-column) 32)))
				 (args (python-split-args text))
				 (nr 0)
				 (formatted-args
					(mapconcat
					 (lambda (x)
						 (concat "   " (nth 0 x)
										 (if make-fields (format " ${%d:arg%d}" (cl-incf nr) nr))
										 (if (nth 1 x) (concat " \(default " (nth 1 x) "\)"))))
					 args
					 indent)))
		(unless (string= formatted-args "")
			(concat
			 (mapconcat 'identity
									(list "" "Args:" formatted-args)
									indent)
			 "\n"))))

(provide 'init-yas)
;;; init-yas.el ends here
