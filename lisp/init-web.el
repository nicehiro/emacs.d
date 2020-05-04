;;; Editing html, css, js settings.
;;; Code:
(use-package emmet-mode
  :ensure t)

(use-package js2-mode
  :ensure t)

(use-package web-mode
  :ensure t
  :custom
  (web-mode-markup-indent-offset 2)
  (web-mode-code-indent-offset 2))

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

;; 打开html文件自动开启js补全
(add-hook 'web-mode-hook (lambda ()
			   (company-mode)
			   ))

(provide 'init-web)
;;; init-web.el ends here
