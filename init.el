;; (setq debug-on-error t)
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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode t)
 '(column-number-mode t)
 '(display-time-mode t)
 '(exec-path (quote ("/usr/local/sbin" "/usr/local/bin" "/usr/sbin" "/usr/bin" "/sbin" "/bin" "/usr/games" "/home/w34p0n/tools/c_dev_el/tools/src" "/home/w34p0n/tools/installed/libexec/emacs/24.1.50/x86_64-unknown-linux-gnu")))
 '(initial-buffer-choice "~/mydisk/workspace/")
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant oblique :weight normal :height 110 :width normal :foundry "adobe" :family "courier"))))
 '(cursor ((t (:background "white" :foreground "white"))))
 '(linum ((t (:inherit (shadow default) :background "#2e3436" :foreground "#888a85"))))
 '(speedbar-highlight-face ((((class color) (background dark)) (:background "sea green"))))
 '(speedbar-selected-face ((t (:background "#960E10" :foreground "white" :weight bold)))))
(require 'baoduy)
(print "Hello my emacs project ::^^::")
