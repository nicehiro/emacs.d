;;; Configration about scientific notes and others


;;; check English spelling mistakes
;; (add-hook 'text-mode-hook 'flyspell-mode)
(use-package flyspell
	:hook
	((text-mode . flyspell-mode))
	:config
	(define-key flyspell-mode-map [down-mouse-3] #'flyspell-correct-word)
	(define-key flyspell-mode-map [mouse-3] #'undefined))


;;; writing tool
;; provide some academic writing phrases
(use-package academic-phrases)


;;; manage papers
;; now I use zotero, but it's not contained in Emacs


;;; manage bib file
(use-package ebib
	:config
	(evil-set-initial-state 'ebib-index-mode 'emacs)
	(evil-set-initial-state 'ebib-entry-mode 'emacs)
	;; open ebib link in org files
	(require 'org-ebib)
	:custom
	(bibtex-autokey-name-case-convert-function 'capitalize)
	(bibtex-autokey-titlewords 0)
	(bibtex-autokey-year-length 4)
	(ebib-uniquify-keys t)
	(ebib-bibtex-dialect 'biblatex)
	(ebib-index-window-size 10)
	(ebib-preload-bib-files '("~/Documents/bibs/RL.bib"))
	(ebib-file-search-dirs '("~/Zotero/storage/"))
	(ebib-keywords-field-keep-sorted t)
	(ebib-keywords-file-save-on-exit 'always)
	(ebib-use-timestamp t "recording the time that entries are added")
	(ebib-index-columns '(("Entry Key" 20 t)
												("Author/Editor" 40 nil)
												("Year" 6 t)
												("Title" 50 t)))
	(ebib-index-default-sort '("timestamp" . descend))
	(ebib-file-associations '(("pdf" . "open")))
	)


(provide 'init-scientific)
;;; init-scientific.el ends here
