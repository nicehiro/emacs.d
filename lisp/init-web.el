;;; Editing html, css, js settings.
;;; Code:
(use-package emmet-mode)

(use-package js2-mode
	:ensure t)

(use-package web-mode
	:ensure t
	:custom
	(web-mode-markup-indent-offset 2)
	(web-mode-code-indent-offset 2))

(use-package js2-refactor)

(use-package xref-js2)

;; 打开.js文件自动启动js2-mode
;; 打开.html文件自动启动web-mode
;; 打开.css文件自动启动css-mode
(setq auto-mode-alist
			(append
			 '(("\\.js\\'" . js2-mode)
	 ("\\.html\\'" . web-mode)
	 ("\\.css\\'" . css-mode))
			 auto-mode-alist))

;; 打开js文件自动启动js补全
(add-hook 'js2-mode-hook (lambda ()
				 (company-mode)))
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-r")
(define-key js2-mode-map (kbd "C-k") #'js2r-kill)
(define-key js-mode-map (kbd "M-.") nil)

(add-hook 'js2-mode-hook (lambda ()
													 (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))

;; 打开html文件自动开启js补全
(add-hook 'web-mode-hook (lambda ()
													 (company-mode)
													 ))

(provide 'init-web)
;;; init-web.el ends here
