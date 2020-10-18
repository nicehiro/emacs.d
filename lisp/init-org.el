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
	:commands
	(org-mode)
	:custom
	(org-agenda-files '("~/Documents/gtd/"))
	(org-capture-templates
	 '(("t" "Todo" entry (file+headline "~/Documents/gtd/inbox.org" "Todo soon")
			"* TODO %? \n %^t")
		 ("i" "Idea" entry (file+headline "~/Documents/gtd/ideas.org" "Ideas")
			"* %? \n %U")
		 ("e" "Tweak" entry (file+headline "~/Documents/gtd/tweaks.org" "Tweaks")
			"* %? \n %U")
		 ("l" "Learn" entry (file+headline "~/Documents/gtd/learn.org" "Learn")
			"* %? \n")
		 ("w" "Work note" entry (file+headline "~/Documents/gtd/work.org" "Work")
			"* %? \n")
		 ("m" "Check movie" entry (file+headline "~/Documents/gtd/check.org" "Movies")
			"* %? %^g")
		 ("n" "Check book" entry (file+headline "~/Documents/gtd/check.org" "Books")
			"* %^{book name} by %^{author} %^g")))
	)

;;; To-do settings
(setq org-todo-keywords
			(quote ((sequence "TODO(t)" "INPROGRESS(I)" "NEXT(n)" "|" "DONE(d!/!)")
				(sequence "PROJECT(p)" "|" "DONE(d!/!)" "CANCELLED(c@/!)")
				(sequence "WAITING(w@/!)" "DELEGATED(e!)" "HOLD(h)" "|" "CANCELLED(c@/!)")
				(sequence "PAIED(P)" "UNPAIED(u)")))
			org-todo-repeat-to-state "NEXT")

(setq org-todo-keyword-faces
			(quote (("NEXT" :inherit warning)
				("PROJECT" :inherit font-lock-string-face))))


;;; Agenda views
(setq-default org-agenda-clockreport-parameter-plist '(:link t :maxlevel 3))


(let ((active-project-match "-INBOX/PROJECT"))

	(setq org-stuck-projects
	`(,active-project-match ("NEXT")))

	(setq org-agenda-compact-blocks t
	org-agenda-sticky t
	org-agenda-start-on-weekday nil
	org-agenda-span 'day
	org-agenda-include-diary nil
	org-agenda-sorting-strategy
	'((agenda habit-down time-up user-defined-up effort-up category-keep)
		(todo category-up effort-up)
		(tags category-up effort-up)
		(search category-up))
	org-agenda-window-setup 'current-window
	org-agenda-custom-commands
	`(("N" "Notes" tags "NOTE"
		 ((org-agenda-overriding-header "Notes")
			(org-tags-match-list-sublevels t)))
		("g" "GTD"
		 ((agenda "" nil)
			(tags "INBOX"
			((org-agenda-overriding-header "Inbox")
			 (org-tags-match-list-sublevels nil)))
			(stuck ""
			 ((org-agenda-overriding-header "Stuck Projects")
				(org-agenda-tags-todo-honor-ignore-options t)
				(org-tags-match-list-sublevels t)
				(org-agenda-todo-ignore-scheduled 'future)))
			(tags-todo "-INBOX"
					 ((org-agenda-overriding-header "Next Actions")
			(org-agenda-tags-todo-honor-ignore-options t)
			(org-agenda-todo-ignore-scheduled 'future)
			(org-agenda-skip-function
			 '(lambda ()
					(or (org-agenda-skip-subtree-if 'todo '("HOLD" "WAITING"))
				(org-agenda-skip-entry-if 'nottodo '("NEXT")))))
			(org-tags-match-list-sublevels t)
			(org-agenda-sorting-strategy
			 '(todo-state-down effort-up category-keep))))
			(tags-todo ,active-project-match
					 ((org-agenda-overriding-header "Projects")
			(org-tags-match-list-sublevels t)
			(org-agenda-sorting-strategy
			 '(category-keep))))
			(tags-todo "-INBOX/-NEXT"
					 ((org-agenda-overriding-header "Orphaned Tasks")
			(org-agenda-tags-todo-honor-ignore-options t)
			(org-agenda-todo-ignore-scheduled 'future)
			(org-agenda-skip-function
			 '(lambda ()
					(or (org-agenda-skip-subtree-if 'todo '("PROJECT" "HOLD" "WAITING" "DELEGATED"))
				(org-agenda-skip-subtree-if 'nottododo '("TODO")))))
			(org-tags-match-list-sublevels t)
			(org-agenda-sorting-strategy
			 '(category-keep))))
			(tags-todo "/WAITING"
					 ((org-agenda-overriding-header "Waiting")
			(org-agenda-tags-todo-honor-ignore-options t)
			(org-agenda-todo-ignore-scheduled 'future)
			(org-agenda-sorting-strategy
			 '(category-keep))))
			(tags-todo "/DELEGATED"
					 ((org-agenda-overriding-header "Delegated")
			(org-agenda-tags-todo-honor-ignore-options t)
			(org-agenda-todo-ignore-scheduled 'future)
			(org-agenda-sorting-strategy
			 '(category-keep))))
			(tags-todo "-INBOX"
					 ((org-agenda-overriding-header "On Hold")
			(org-agenda-skip-function
			 '(lambda ()
					(or (org-agenda-skip-subtree-if 'todo '("WAITING"))
				(org-agenda-skip-entry-if 'nottodo '("HOLD")))))
			(org-tags-match-list-sublevels nil)
			(org-agenda-sorting-strategy
			 '(category-keep))))
			;; (tags-todo "-NEXT"
			;;            ((org-agenda-overriding-header "All other TODOs")
			;;             (org-match-list-sublevels t)))
			)))))

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

(add-hook 'org-agenda-finalize-hook #'my:org-agenda-time-grid-spacing)

(use-package org-bullets
	:ensure t
	:custom
	(org-bullets-mode t))

(use-package ox-pandoc)

(require 'org-tempo)

(provide 'init-org)
;;; init-org.el ends here
