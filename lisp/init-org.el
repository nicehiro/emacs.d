;;; -*- lexical-binding: t -*-

(use-package pangu-spacing)
(global-pangu-spacing-mode 1)

;;; Org mode configration.
(use-package org
	:bind
	(:map global-map
				("C-c a" . org-agenda))
	(:map global-map
				("C-c l" . org-store-link))
	(:map global-map
				("C-c c" . org-capture))
	:hook
	(org-mode . org-indent-mode)
	;; (org-mode . toggle-truncate-lines)
	(org-mode . toggle-word-wrap)
	(org-agenda-mode . hl-line-mode)
	(org-mode . (lambda () (org-bullets-mode 1)))
	(org-mode . (lambda () (set (make-local-variable 'pangu-spacing-real-insert-separtor) t)))
	:config
	(setq org-src-fontify-natively t)
	)

(use-package org-gtd
	:after org
	:quelpa
	(org-gtd :repo nicehiro/org-gtd.el
					 :fetcher github)
	:demand t ;; without this, the package won't be loaded, so org-agenda won't be configured
	:custom
	;; where org-gtd will put its files. This value is also the default one.
	(org-gtd-directory "~/Documents/gtd/")
	;; package: https://github.com/Malabarba/org-agenda-property
	;; this is so you can see who an item was delegated to in the agenda
	(org-agenda-property-list '("DELEGATED_TO"))
	;; I think this makes the agenda easier to read
	(org-agenda-property-position 'next-line)
	;; package: https://www.nongnu.org/org-edna-el/
	;; org-edna is used to make sure that when a project task gets DONE,
	;; the next TODO is automatically changed to NEXT.
	(org-edna-use-inheritance t)
	:config
	(org-edna-load)
	:bind
	(("C-c f c" . org-gtd-capture) ;; add item to inbox
	("C-c f a" . org-agenda-list) ;; see what's on your plate today
	("C-c f p" . org-gtd-process-inbox) ;; process entire inbox
	("C-c f n" . org-gtd-show-all-next) ;; see all NEXT items
	("C-c f s" . org-gtd-show-stuck-projects)) ;; see projects that don't have a NEXT item
	:init
	(bind-key "C-c c" 'org-gtd-clarify-finalize)
	)

(use-package org-agenda
	:ensure nil ;; this is how you tell use-package to manage a sub-package
	:after org-gtd ;; because we need to add the org-gtd directory to the agenda files
	;; use as-is if you don't have an existing org-agenda setup
	;; otherwise push the directory to the existing list
	:custom
	(org-agenda-files `(,org-gtd-directory))
	;; a useful view to see what can be accomplished today
	(org-agenda-custom-commands '(("g" "Scheduled today and all NEXT items" ((agenda "" ((org-agenda-span 1))) (todo "NEXT"))))))

(use-package org-capture
	:ensure nil
	;; note that org-gtd has to be loaded before this
	:after org-gtd
	:config
	;; use as-is if you don't have an existing set of org-capture templates
	;; otherwise add to existing setup
	;; you can of course change the letters, too
	(setq org-capture-templates `(("i" "Inbox"
															 entry (file ,(org-gtd--path org-gtd-inbox-file-basename))
															 "* %?\n%U\n\n  %i"
															 :kill-buffer t)
															("l" "Todo with link"
															 entry (file ,(org-gtd--path org-gtd-inbox-file-basename))
															 "* %?\n%U\n\n  %i\n  %a"
															 :kill-buffer t))))

;; Org block show with color and line spacing.
;; Copied from https://emacs-china.org/t/org-agenda/8679
(defun my:org-agenda-time-grid-spacing ()
	"Set different line spacing w.r.t. time duration."
	(save-excursion
		(let* ((background (alist-get 'background-mode (frame-parameters)))
					 (background-dark-p (string= background "dark"))
					 (colors (if background-dark-p
											 (list "#aa557f" "DarkGreen" "DarkSlateGray" "DarkSlateBlue")
										 (list "#F6B1C3" "#FFFF9D" "#BEEB9F" "#ADD5F7")))
					 pos
					 duration)
			(nconc colors colors)
			(goto-char (point-min))
			(while (setq pos (next-single-property-change (point) 'duration))
				(goto-char pos)
				(when (and (not (equal pos (point-at-eol)))
									 (setq duration (org-get-at-bol 'duration)))
					(let ((line-height (if (< duration 30) 1.0 (+ 0.5 (/ duration 60))))
								(ov (make-overlay (point-at-bol) (1+ (point-at-eol)))))
						(overlay-put ov 'face `(:background ,(car colors)
																								:foreground
																								,(if background-dark-p "black" "white")))
						(setq colors (cdr colors))
						(overlay-put ov 'line-height line-height)
						(overlay-put ov 'line-spacing (1- line-height))))))))


(add-to-list 'org-agenda-custom-commands
						 '("W" "Weekly review"
							 agenda ""
							 ((org-agenda-start-day "-6d")
								(org-agenda-span 7)
								(org-agenda-start-on-weekday 1)
								(org-agenda-archive-mode 1)
								(org-agenda-start-with-log-mode 1)
								)))


(add-hook 'org-agenda-finalize-hook #'my:org-agenda-time-grid-spacing)

(use-package org-bullets
	:ensure t
	:custom
	(org-bullets-mode t))

(use-package ox-pandoc)

(require 'org-tempo)

(add-hook 'org-mode-hook
					(lambda () (setq line-spacing 0.2)))

(setq org-startup-with-inline-images t)
(setq org-image-actual-width nil)

;; make more clear latex preview image
(setq org-preview-latex-default-process 'dvisvgm)

;; org download
(use-package org-download
	:hook
	((dired-mode . org-download-enable))
	:config
	(setq-default org-download-image-dir "~/Pictures/org-download/")
	(setq-default org-download-image-org-width 400)
	(setq-default org-download-image-latex-width 400)
	(setq-default org-download-image-attr-list
								'("#+attr_html: scale=0.8 :align center")))

(use-package org-link-beautify
	:config
	(org-link-beautify-mode 1))

;; update latex preview image when background changed
;; Copied from https://github.com/hlissner/emacs-solaire-mode/issues/24
(defun +org-update-latex-preview-background-color (&rest _)
	(setq-default
	 org-format-latex-options
	 (plist-put org-format-latex-options
							:background
							(face-attribute (or (cadr (assq 'default face-remapping-alist))
																	'default)
															:background nil t))))
(advice-add #'load-theme :after #'+org-update-latex-preview-background-color)

(provide 'init-org)
;;; init-org.el ends here
