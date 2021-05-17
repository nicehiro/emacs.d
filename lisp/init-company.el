;;; -*- lexical-binding: t -*-
;;; Completion

;;; auto complete pairs
(electric-pair-mode 1)


(defconst clangd-p
	(or (executable-find "clangd")  ;; usually
			(executable-find "/usr/local/opt/llvm/bin/clangd"))  ;; macOS
	"Do we have clangd?")

(use-package company
	:diminish company-mode
	:hook ((prog-mode LaTeX-mode latex-mode ess-r-mode) . company-mode)
	:bind
	(:map company-active-map
				([tab] . smarter-tab-to-complete)
				("TAB" . smarter-tab-to-complete))
	:custom
	(company-minimum-prefix-length 3)
	(company-tooltip-align-annotations t)
	(company-require-match 'never)
	;; Don't use company in the following modes
	(company-global-modes '(not shell-mode eaf-mode))
	;; Trigger completion immediately.
	(company-idle-delay 0.1)
	;; Number the candidates (use M-1, M-2 etc to select completions).
	(company-show-numbers t)
	:config
	(unless clangd-p (delete 'company-clang company-backends))
	(global-company-mode 1)
	(defun smarter-tab-to-complete ()
		"Try to `org-cycle', `yas-expand', and `yas-next-field' at current cursor position.

If all failed, try to complete the common part with `company-complete-common'"
		(interactive)
		(when yas-minor-mode
			(let ((old-point (point))
						(old-tick (buffer-chars-modified-tick))
						(func-list
						 (if (equal major-mode 'org-mode) '(org-cycle yas-expand yas-next-field)
							 '(yas-expand yas-next-field))))
				(catch 'func-suceed
					(dolist (func func-list)
						(ignore-errors (call-interactively func))
						(unless (and (eq old-point (point))
												 (eq old-tick (buffer-chars-modified-tick)))
							(throw 'func-suceed t)))
					(company-complete-common))))))


(provide 'init-company)
;;; init-company.el ends here
