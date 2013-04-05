(setq debug-on-error t)
(defvar  baoduy-emacs-src 
  (file-name-directory load-file-name) "This is a initialize for my repo")
(print baoduy-emacs-src)
(setq user-emacs-directory baoduy-emacs-src)
(let ((default-directory baoduy-emacs-src))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))
(defvar baoduy-repo-path 
  (concat baoduy-emacs-src "repo/") "This is a path to my repo path")
(require 'baoduy)
(print "Hello project ::^^::")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
