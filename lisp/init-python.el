;;; -*- lexical binding: t -*-
;;; Python configration in Emacs.

(use-package envrc
	:config
	(envrc-global-mode))

(use-package python-black
	:demand t
	:after python
	:hook
	((python-mode . python-black-on-save-mode)))

(use-package sphinx-doc
	:hook
	((python-mode . sphinx-doc-mode)))

(provide 'init-python)
;;; init-python.el ends here
