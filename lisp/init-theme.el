;; (add-to-list 'load-path "~/Projects/hiro-themes/")
;; (add-to-list 'load-path "~/.emacs.d/themes/")
;; (require 'hiro-emacs-dark-theme)

;; (load-theme 'hiro-emacs-dark t)
;; (load-theme 'solarized-dark)
;; (use-package doom-themes
;;	:config
;;	;; Global settings (defaults)
;;	(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
;;				doom-themes-enable-italic t) ; if nil, italics is universally disabled
;;	(load-theme 'doom-one t)

;;	;; Enable flashing mode-line on errors
;;	(doom-themes-visual-bell-config)

;;	;; Enable custom neotree theme (all-the-icons must be installed!)
;;	(doom-themes-neotree-config)
;;	;; or for treemacs users
;;	(setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
;;	(doom-themes-treemacs-config)

;;	;; Corrects (and improves) org-mode's native fontification.
;;	(doom-themes-org-config))

;; (load-theme 'doom-solarized-dark)

(add-to-list 'load-path "~/.emacs.d/quelpa/build/minad-chill-theme/")
(require 'chili-light-theme)
(require 'chili-dark-theme)

;; (load-theme 'chili-light t)

(use-package nimbus-theme
	:quelpa (nimbus-theme :repo "m-cat/nimbus-theme"
												:fetcher github))

(use-package auto-dark-emacs
	:quelpa (auto-dark-emacs :repo "nicehiro/auto-dark-emacs"
													 :fetcher github)
	:config
	(setq auto-dark-emacs/dark-theme 'chili-dark)
	(setq auto-dark-emacs/light-theme 'chili-light)
	;; if not support buit-in method to check current dark mode state,
	;; use osascript instead
	(setq auto-dark-emacs/allow-osascript t)
	(run-with-timer 0 auto-dark-emacs/polling-interval-seconds
									'auto-dark-emacs/check-and-set-dark-mode)
	)

(provide 'init-theme)
;;; init-theme.el ends here
