(use-package popwin
	:quelpa (popwin :repo "emacsorphanage/popwin" :fetcher github))


(use-package netease-music
	:ensure nil
	:load-path "~/Projects/netease-music/"
	:config
	(setq netease-music-username "17826856902")
	(setq netease-music-user-password "w1234567")
	(setq netease-music-user-id "454342623")
	(setq netease-music-api "http://localhost:3000"))

(evil-define-key
	'normal
	netease-music-mode-map
	(kbd "RET")
	'netease-music-jump-into)
(evil-define-key
	'normal
	netease-music-mode-map
	(kbd "n")
	'netease-music-play-next)
(evil-define-key
	'normal
	netease-music-mode-map
	(kbd "p")
	'netease-music-toggle)
(evil-define-key
	'normal
	netease-music-mode-map
	(kbd "q")
	'quit-window)


(provide 'init-music)
;;; init-music.el ends here
