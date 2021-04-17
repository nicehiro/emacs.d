;;; Solve leetcode in Emacs. -*- lexical binding: t -*-

(use-package leetcode
	:config
	(setq leetcode--domain "leetcode-cn.com")
	(setq leetcode--base-url "https://leetcode-cn.com")
	(setq leetcode-prefer-language "python3")
	(setq leetcode-prefer-sql "mysql")
	(setq leetcode-directory "~/Projects/LeetCode-Python/"))

(provide 'init-leetcode)
;;; init-leetcode.el ends here
