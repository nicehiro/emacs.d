(add-to-list 'exec-path "/usr/local/Cellar/pandoc/2.9.2.1/bin")

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
	(add-to-list 'load-path (concat hiro/emacs-dir "lisp/")) ;; Package & use-package & quelpa & melpa initialize
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
	;;(require 'init-looks)
	(require 'init-edit)
	(require 'init-rime)
	(require 'init-org)
	(require 'init-prog)
	(require 'init-blog)
	(require 'init-ivy)
	(require 'init-latex)
	(require 'init-git)
	(require 'init-translate)
	;; (require 'init-wakatime)
	(require 'init-reading)
	(require 'init-key)
	(require 'init-web)
	(require 'others)
	(require 'init-ledger)
	(require 'init-languages)
	(require 'init-snails)
	(require 'init-roam)
	(require 'init-looks)
	;; (require 'elegant-emacs-common)
	;; (require 'elegance)
	)

;; (load-theme 'elegant-emacs-light)
(toggle-debug-on-error t)

;;; Proper GC.
(setq gc-cons-threshold (* 1024 128))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(add-to-list 'auto-mode-alist t)
 '(ansi-color-faces-vector
	 [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
	 ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#839496"])
 '(beacon-color "#c82829")
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
 '(compilation-message-face 'default)
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
	 '("82f6b1efc625ceb3c990165cebe1030fa320cd598f092376993a8acfe0b61a2c" "1e495fe6956309fe55c8068b1caf1dfb8403073ae3d99b882d80f7a9a77b0e58" "609889e612bd074f53fbe5dd3a193fff19e5e286d5be7f5351e060c84415f422" "21685a6d388d600fc74d89cdbe48160c30baa89118d21268935f17ad93d73cf7" "aac9292d0a013a580ca2ef9285cae5d81e73e82d777b00847c252b4c165b4ffe" "294a0aca6299b9b5e98459409b83fe7bfaf1adcbb84d4c6c3da1356c28ebcd06" "a65c7bd2df9d8200f174d23130b97f33b1337b61d6aeff80c23b3dc08dd3f16b" "3dfde7bbe7c224bea0a256f69f71297f46fa2fde7151cb98ec4651f30ebbd907" "3a5f179116bc16754d22b273aa0894b1eb65b2820fcea7dc19f4a6c2646aedeb" "b9407aa5270d1d586288839521972fea76a27cbc344c2ff71eeb9fe4fb7e5d91" "be1bf23293198c688b417a656068e6dfbc74136414227dc192224d424f37642d" "7005ce0632b80b6de59136136ffe4cbe27cfa94df186d49549cb0352d4cc8ebf" "61686d1c82bc61e02d2c8f5158ad9f3a6fa2419093d5881616da5f1481692534" "63f2a18f7e2f387e35fe6bf54f7bd10d292581ec9fd1ac6abeb7eabb74e564a1" "7315c9bf32a1478f95c00eaebde9f51df109bf63e51b3522d5401bdf2682d33b" "78a3ddbdeba9ad2fea27665336c59bcb01a0e5d9f61a19440aa91f89d4eea3a7" "3bc94e6145be1719482bab48bd40c9193fad7092a1d72fa649e76fb93100c535" "cfabd8d48cf92b7e386feae238d19258dc4994bc4887c1b0e9238340220322b6" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" "c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" "801a567c87755fe65d0484cb2bded31a4c5bb24fd1fe0ed11e6c02254017acb2" "d4131a682c4436bb5a61103d9a850bf788cbf793f3fd8897de520d20583aeb58" "efbd20364f292a1199d291dfaff28cc1fd89fff5b38e314bd7e40121f5c465b4" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "ff6c5a15591b98a58a7a68a969f7143e3e663991c31bf55ff0807f17e223af4b" "d0aa1464d7e55d18ca1e0381627fac40229b9a24bca2a3c1db8446482ce8185e" "d06cf62056bc85ec1673d7a45fd4be277fc15300732540e87acd4496aa0ccc46" "922e96b74620a11b52434d551cf7115b8274dfa42b289eeec44d93378d0bf093" default))
 '(debug-on-error t)
 '(default-input-method "rime")
 '(fci-rule-color "#eee8d5")
 '(flycheck-color-mode-line-face-to-color 'mode-line-buffer-id)
 '(frame-background-mode 'light)
 '(highlight-changes-colors '("#d33682" "#6c71c4"))
 '(highlight-symbol-colors
	 '("#efe4da49afb1" "#cfc4e1acd08b" "#fe52c9e6b34e" "#dbb6d3c2dcf3" "#e183dee0b053" "#f944cc6dae47" "#d35fdac4e069"))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors
	 '(("#eee8d5" . 0)
		 ("#b3c34d" . 20)
		 ("#6ccec0" . 30)
		 ("#74adf5" . 50)
		 ("#e1af4b" . 60)
		 ("#fb7640" . 70)
		 ("#ff699e" . 85)
		 ("#eee8d5" . 100)))
 '(hl-bg-colors
	 '("#e1af4b" "#fb7640" "#ff6849" "#ff699e" "#8d85e7" "#74adf5" "#6ccec0" "#b3c34d"))
 '(hl-fg-colors
	 '("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3"))
 '(hl-paren-colors '("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900"))
 '(indent-guide-recursive t)
 '(load-theme 'fantom-theme t)
 '(lsp-ui-doc-border "#586e75")
 '(nov-shr-rendering-functions nil t)
 '(nov-text-width 80)
 '(nrepl-message-colors
	 '("#dc322f" "#cb4b16" "#b58900" "#5b7300" "#b3c34d" "#0061a8" "#2aa198" "#d33682" "#6c71c4"))
 '(org-agenda-files '("~/Documents/gtd/"))
 '(org-bullets-mode t t)
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
			"* %^{book name} by %^{author} %^g")))
 '(package-selected-packages
	 '(org-roam-protocol org-roam-server rainbow-mode foggy-night-theme exec-path-from-shell snails org-roam pangu-spacing js2-refactor xref-js2 cdlatex tex auctex kana solarized-theme theme-changer tao-theme company-tip color-theme-sanityinc-tomorrow flycheck-ledger ledger-mode nord-theme rainbow-fart nox tron-legacy-theme valign ox-pandoc jupyter emacs-jupyter web-mode js2-mode emmet-mode yasnippet srcery-theme srcery screry-theme fantom-theme which-key magic-latex-buffer olivetti shr-tag-pre-highlight nov org-bullets shrface flycheck indent-guide eglot youdao-dictionary rime evil-surround evil mini-modeline company use-package quelpa-use-package))
 '(pos-tip-background-color "#eee8d5")
 '(pos-tip-foreground-color "#586e75")
 '(rime-cursor "˰")
 '(rime-disable-predicates
	 '(rime-predicate-prog-in-code-p rime-predicate-after-alphabet-char-p))
 '(rime-inline-predicates
	 '(rime-predicate-space-after-cc-p hiro/rime-predicate-is-back-quote-or-tilde rime-predicate-current-uppercase-letter-p))
 '(rime-show-candidate 'posframe)
 '(rime-translate-keybindings '("C-f" "C-b" "C-n" "C-p" "C-g") t)
 '(shrface-bullets-bullet-list '("◉" "○" "●" "✿" "◆" "◉"))
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(srcery-org-height nil)
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
	 '((20 . "#dc322f")
		 (40 . "#cb4366eb20b4")
		 (60 . "#c1167942154f")
		 (80 . "#b58900")
		 (100 . "#a6ae8f7c0000")
		 (120 . "#9ed892380000")
		 (140 . "#96be94cf0000")
		 (160 . "#8e5397440000")
		 (180 . "#859900")
		 (200 . "#77679bfc4635")
		 (220 . "#6d449d465bfd")
		 (240 . "#5fc09ea47092")
		 (260 . "#4c68a01784aa")
		 (280 . "#2aa198")
		 (300 . "#303498e7affc")
		 (320 . "#2fa1947cbb9b")
		 (340 . "#2c879008c736")
		 (360 . "#268bd2")))
 '(vc-annotate-very-old-color nil)
 '(wakatime-api-key "2f0b0d1a-6544-47e9-8cb7-d32a4697c47b")
 '(wakatime-cli-path "/home/hiro/.local/bin/wakatime")
 '(wakatime-python-bin nil)
 '(web-mode-code-indent-offset 2)
 '(web-mode-markup-indent-offset 2)
 '(weechat-color-list
	 '(unspecified "#fdf6e3" "#eee8d5" "#a7020a" "#dc322f" "#5b7300" "#859900" "#866300" "#b58900" "#0061a8" "#268bd2" "#a00559" "#d33682" "#007d76" "#2aa198" "#657b83" "#839496"))
 '(which-key-setup-minibuffer nil t)
 '(window-divider-mode nil)
 '(xterm-color-names
	 ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#073642"])
 '(xterm-color-names-bright
	 ["#fdf6e3" "#cb4b16" "#93a1a1" "#839496" "#657b83" "#6c71c4" "#586e75" "#002b36"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor ((t (:background "dark cyan"))))
 '(rime-code-face ((t (:inherit default))))
 '(rime-default-face ((t (:background "gray26" :foreground "dark cyan"))))
 '(web-mode-html-tag-bracket-face ((t (:foreground "gray50")))))
