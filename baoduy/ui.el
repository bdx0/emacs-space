;; UI
(dbd-log "load ui.el")
;; set title frame format
(require 'customize-tabbar)
;; config for linum
(require 'linum) 
(global-linum-mode 1)
(setq linum-format
      (lambda (line)
	(propertize (format
		     (let ((w (length (number-to-string
				       (count-lines (point-min) (point-max))))))
		       (concat " %" (number-to-string w) "d"))
		     line)
		    'face 'linum)))

(setq x-select-enable-clipboard t) 
(setq indent-tabs-mode t)
(setq tab-width 4)
(setq tab-stop-list ())
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome")
;; Display the time
(setq display-time-default-load-average nil)
(setq display-time-use-mail-icon t)
(setq display-time-24hr-format t)
(display-time-mode t)

(dbd-log "load cui.el")
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
;; (require 'color-theme)
;; (color-theme-initialize)
;; (color-theme-billw)
(require 'color-theme-wombat+)
(color-theme-wombat+)

;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 90 :width normal))))
;;  '(show-paren-match ((t (:background "gray30"))))
;;  '(show-paren-mismatch ((((class color)) (:background "red" :foreground "white"))))
;;  '(highlight ((t (:background "gray15"))))
;;  )

(dbd-set-title-mode (let ((mode-local (getenv "WORK_MODE"))
			  )
		      (print mode-local)
		      (if (or (string= mode-local "") (string= mode-local "nil"))
			"ORGMODE"
			mode-local)))
;; end UI
(provide 'baoduy/ui)
