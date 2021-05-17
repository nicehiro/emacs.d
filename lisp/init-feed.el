;;; Read RSS feeds in Emacs!



(use-package elfeed
	:config
	(evil-set-initial-state 'elfeed-search-mode 'emacs)
	(evil-set-initial-state 'elfeed-show-mode 'emacs)
	(setq elfeed-feeds
				'(
					;; programming
					("http://114.55.141.180:1200/github/trending/daily/python" GitHubDaily)
					("https://d12frosted.io/atom.xml" d12frosted)
					("https://oremacs.com/atom.xml" oremacs)
					;; programming languages
					("https://sebastianraschka.com/rss_feed.xml" Sebastianraschka)
					;; rl
					("https://lilianweng.github.io/lil-log/feed.xml" LilianWeng)
					;; reading
					("http://114.55.141.180:1200/blogs/paulgraham" PaulGraham)
					("http://114.55.141.180:1200/amazon/ku/this" KindleUnlimited)
					("http://114.55.141.180:1200/blogs/wangyin" WangYin)
					("http://114.55.141.180:1200/blogs/wang54" Wang54)
					("http://114.55.141.180:1200/security/pulses" SecurityDaily)
					("http://114.55.141.180:1200/meituan/tech/home" MeiTuanTech)
					;; life
					("http://114.55.141.180:1200/uniqlo/stylingbook/men" Uniqlo)
					;; game
					("http://114.55.141.180:1200/nintendo/direct" Nintendo)
					;; english
					("http://114.55.141.180:1200/51voa/standard" VOA-Standard-English)
					)))

(provide 'init-feed)
;;; init-feed.el ends here
