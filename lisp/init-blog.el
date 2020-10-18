;;; init-blog.el --- export org files to html -*- lexical-binding -*-
;;; Commentary:
;;; Code:
(require 'ox-publish)
(setq org-publish-project-alist
			'(
	("org-notes"
	 :base-directory "~/Documents/org-files/"
	 :base-extension "org"
	 :publishing-directory "~/Projects/nicehiro.github.io/"
	 :recursive t
	 :exports both
	 :publishing-function org-html-publish-to-html
	 :headline-levels 4
	 :html-postamble  "<p class=\"postamble\"><a href=\"http://www.gnu.org/software/emacs/\">Emacs</a> 27 (<a href=\"https://orgmode.org\">Org</a> mode 9)</p>
			<script src=\"https://utteranc.es/client.js\"
	repo=\"nicehiro/nicehiro.github.io\"
	issue-term=\"pathname\"
	theme=\"github-light\"
	crossorigin=\"anonymous\"
	async>
	</script>"
	 :auto-sitemap t)
	("org-img"
	 :base-directory "~/Documents/org-files/img/"
	 :base-extension "png\\|jpg\\|gif\\|ogg\\|swf"
	 :publishing-directory "~/Projects/nicehiro.github.io/img/"
	 :recursive t
	 :publishing-function org-publish-attachment)
	("org-css"
	 :base-directory "~/Documents/org-files/css/"
	 :base-extension "css"
	 :publishing-directory "~/Projects/nicehiro.github.io/css/"
	 :recursive t
	 :publishing-function org-publish-attachment)
	("org"
	 :components ("org-notes" "org-img" "org-css"))))

(provide 'init-blog)
;;; init-blog.el ends here
