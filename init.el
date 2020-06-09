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
  (require 'init-reading)
  (require 'init-key)
  (require 'init-web)
  )

;;; Proper GC.
(setq gc-cons-threshold (* 1024 128))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(add-to-list 'auto-mode-alist t)
 '(company-abort-manual-when-too-short t)
 '(company-backends
   '(company-capf company-files company-css
		  (company-dabbrev-code company-gtags company-etags company-keywords)
		  company-dabbrev))
 '(company-dabbrev-downcase nil)
 '(company-frontends
   '(company-tng-frontend company-pseudo-tooltip-frontend company-echo-metadata-frontend))
 '(company-global-modes '(not dired-mode dired-sidebar-mode))
 '(company-idle-delay 0.5)
 '(company-minimum-prefix-length 5)
 '(company-require-match nil)
 '(company-tng-configure-default nil t)
 '(custom-safe-themes
   '("d0aa1464d7e55d18ca1e0381627fac40229b9a24bca2a3c1db8446482ce8185e" "d06cf62056bc85ec1673d7a45fd4be277fc15300732540e87acd4496aa0ccc46" "922e96b74620a11b52434d551cf7115b8274dfa42b289eeec44d93378d0bf093" default))
 '(default-input-method "rime")
 '(global-wakatime-mode t)
 '(indent-guide-recursive t)
 '(load-theme 'fantom-theme t)
 '(mini-modeline-enhance-visual nil)
 '(mini-modeline-mode t)
 '(mini-modelineecho-duration 2 t)
 '(nov-shr-rendering-functions nil t)
 '(nov-text-width 80)
 '(org-agenda-files '("~/Documents/gtd/"))
 '(org-capture-templates
   '(("t" "Todo" entry
      (file+headline "~/Documents/gtd/inbox.org" "Todo soon")
      "* TODO %?
 %^t")
     ("i" "Idea" entry
      (file+headline "~/Documents/gtd/ideas.org" "Ideas")
      "* %?
 %U")
     ("e" "Tweak" entry
      (file+headline "~/Documents/gtd/tweaks.org" "Tweaks")
      "* %?
 %U")
     ("l" "Learn" entry
      (file+headline "~/Documents/gtd/learn.org" "Learn")
      "* %?
")
     ("w" "Work note" entry
      (file+headline "~/Documents/gtd/work.org" "Work")
      "* %?
")
     ("m" "Check movie" entry
      (file+headline "~/Documents/gtd/check.org" "Movies")
      "* %? %^g")
     ("n" "Check book" entry
      (file+headline "~/Documents/gtd/check.org" "Books")
      "* %^{book name} by %^{author} %^g")) t)
 '(package-selected-packages
   '(nox tron-legacy-theme valign ox-pandoc jupyter emacs-jupyter web-mode js2-mode emmet-mode yasnippet srcery-theme srcery screry-theme fantom-theme which-key magic-latex-buffer olivetti shr-tag-pre-highlight nov org-bullets shrface flycheck indent-guide eglot youdao-dictionary rime evil-surround evil mini-modeline company use-package quelpa-use-package))
 '(rime-cursor "˰")
 '(rime-disable-predicates
   '(rime-predicate-prog-in-code-p rime-predicate-after-alphabet-char-p))
 '(rime-inline-predicates
   '(rime-predicate-space-after-cc-p hiro/rime-predicate-is-back-quote-or-tilde rime-predicate-current-uppercase-letter-p))
 '(rime-show-candidate 'posframe)
 '(rime-translate-keybindings '("C-f" "C-b" "C-n" "C-p" "C-g") t)
 '(shrface-bullets-bullet-list '("◉" "○" "●" "✿" "◆" "◉"))
 '(wakatime-api-key "2f0b0d1a-6544-47e9-8cb7-d32a4697c47b")
 '(wakatime-cli-path "/home/hiro/.local/bin/wakatime")
 '(wakatime-python-bin nil)
 '(which-key-setup-minibuffer nil t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
