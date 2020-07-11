;;; init-blog.el --- export org files to html -*- lexical-binding -*-
;;; Commentary:
;;; Code:
(require 'ox-publish)
(setq org-publish-project-alist
      '(
	("org-notes"
	 :base-directory "~/Documents/org-files/"
	 :base-extension "org"
	 :publishing-directory "~/Documents/nicehiro.me/"
	 :recursive t
	 :publishing-function org-html-publish-to-html
	 :headline-levels 4
	 :html-postamble  "<p class=\"postamble\">Last Updated %C. Created by %a.</p>
	    <script src=\"https://utteranc.es/client.js\"
	repo=\"nicehiro/nicehiro.github.io\"
	issue-term=\"pathname\"
	theme=\"github-light\"
	crossorigin=\"anonymous\"
	async>
	</script>"
	 :auto-sitemap t)
	("org-static"
	 :base-directory "~/Documents/org-files/"
	 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
	 :publishing-directory "~/Documents/nicehiro.me/"
	 :recursive t
	 :publishing-function org-publish-attachment)
	("org"
	 :components ("org-notes" "org-static"))))

(provide 'init-blog)
;;; init-blog.el ends here
