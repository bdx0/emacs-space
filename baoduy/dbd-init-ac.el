;;; dbd-init-ac.el --- Place config for auto-complete in here.

;;; Commentary:
;; 
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories (concat baoduy-repo-path "auto-complete/dict"))
(require 'auto-complete-config)
(dolist (mode '(magit-log-edit-mode log-edit-mode org-mode text-mode haml-mode
                sass-mode yaml-mode csv-mode espresso-mode haskell-mode
                html-mode nxml-mode sh-mode smarty-mode clojure-mode
                lisp-mode textile-mode markdown-mode tuareg-mode
                js3-mode css-mode less-css-mode sql-mode ielm-mode cmake-mode c-mode-common-hook java-mode))
  (add-to-list 'ac-modes mode)
  )

(defun ac-config-custom ()
  "This function make a custom config for auto-complete package."
  (ac-add-sources '(ac-source-abbrev
		    ac-source-dictionary ac-source-yasnippet
		    ac-source-features ac-source-words-in-all-buffer
		    ) t)
  (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
  (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
  (add-hook 'css-mode-hook 'ac-css-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))

(ac-config-custom)

(provide 'baoduy/dbd-init-ac)

;;; dbd-init-ac.el ends here
