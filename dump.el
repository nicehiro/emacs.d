;;; Load configuration.
(load (expand-file-name "init.el" user-emacs-directory))

;;; Ensure every installed packages are installed.
(dolist (package package-activated-list)
  (require package))

;;; Do not load tramp in pdump.
(tramp-unload-tramp)

;;; Test if we are using dumped file.
(setq hiro/dumped-load-path load-path)

;;; Disable GC.
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

(dump-emacs-portable "~/.emacs.d/emacs.pdmp")
