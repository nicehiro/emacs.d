(defvar hiro/dumped-load-path nil
  "Not nil when using dump.")

(when hiro/dumped-load-path
  ;; Restore load path
  (setq load-path hiro/dumped-load-path)
  ;; Disable error message
  (setq warning-minimum-level :emergency)
  (global-font-lock-mode t)
  (transient-mark-mode t))

(unless hiro/dumped-load-path
  ;; load path for user config
  (setq hiro/init-file (or load-file-name (buffer-file-name)))
  (setq hiro/emacs-dir (file-name-directory hiro/init-file))
  (add-to-list 'load-path (concat hiro/emacs-dir "lisp/"))
  ;; Package & use-package & quelpa & melpa initialize
  (require 'package)
  (setq package-archives
	'(("gnu" . "http://elpa.emacs-china.org/gnu/")
	  ("melpa" . "http://elpa.emacs-china.org/melpa/")
	  ("melpa-stable" . "http://elpa.emacs-china.org/melpa-stable/")))
  (package-initialize)
  (setq package-selected-packages
	'(use-package quelpa-use-package))
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (package package-selected-packages)
    (when (and (assq package package-archive-contents)
               (not (package-installed-p package)))
      (package-install package t)))
  (setq quelpa-checkout-melpa-p nil)
  (setq quelpa-update-melpa-p nil)
  (setq use-package-always-demand t)
  (setq use-package-always-ensure t)
  (require 'use-package)
  (require 'quelpa-use-package)
  (quelpa-use-package-activate-advice)
  ;; Modules
  (require 'init-company)
  (require 'init-looks)
  (require 'init-edit)
  (require 'init-rime)
  (require 'init-org)
  (require 'init-prog)
  (require 'init-blog)
  (require 'init-ivy)
  (require 'init-latex)
  (require 'init-git)
  (require 'init-translate)
  (require 'init-wakatime)
  )

;;; Proper GC.
(setq gc-cons-threshold (* 1024 128))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-abort-manual-when-too-short t)
 '(company-dabbrev-downcase nil)
 '(company-frontends
   '(company-tng-frontend company-pseudo-tooltip-frontend company-echo-metadata-frontend))
 '(company-global-modes '(not dired-mode dired-sidebar-mode))
 '(company-idle-delay 0.5)
 '(company-minimum-prefix-length 5)
 '(company-require-match nil)
 '(company-tng-configure-default nil t)
 '(package-selected-packages
   '(youdao-dictionary rime evil-surround evil mini-modeline company use-package quelpa-use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
