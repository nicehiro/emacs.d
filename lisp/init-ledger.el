;;; package --- Summary
;;; Commentary:
;;; Code:
(use-package ledger-mode
	:bind
	(:map ledger-mode-map
				("q" . delete-current-window)))
(add-hook 'ledger-mode-hook
					(lambda ()
						(setq-local tab-always-indent 'complete)
						(setq-local completion-cycle-threshold t)
						(setq-local ledger-complete-in-steps t)))

(use-package flycheck-ledger
	:after ledger-mode)

(provide 'init-ledger)
;;; init-ledger.el ends here
