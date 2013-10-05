(print "load cui.el")
;;; set default for mode-line
(setq-default  mode-line-format (quote
                                 ("%e" mode-line-front-space mode-line-mule-info mode-line-client mode-line-modified
                                  mode-line-remote mode-line-frame-identification mode-line-buffer-identification
                                  "    " (:eval(substring
                                                (system-name) 0 (string-match "\\..+" (system-name))))
                                  ":" default-directory #(" " 0 1 (help-echo "mouse-1: select window, mouse-2: delete others ..."))
                                  "   " mode-line-position (vc-mode vc-mode)
                                  "  " mode-line-modes mode-line-misc-info mode-line-end-spaces)))
;;; config for ui
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(global-hl-line-mode)
(delete-selection-mode t)
(transient-mark-mode t)
;;; get color theme
(require 'color-theme)
(color-theme-initialize)
(color-theme-tty-dark)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 90 :width normal))))
 '(show-paren-match ((t (:background "gray30"))))
 '(show-paren-mismatch ((((class color)) (:background "red" :foreground "white"))))
 '(highlight ((t (:background "gray15"))))
 )
(provide 'baoduy/cui)
