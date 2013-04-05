;; UI
;; set title frame format
(require 'customize-tabbar)
(setq frame-title-format
      (list (format "cedet@%s %%S: %%j " (system-name))
	    '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

;; config for linum
;; (load-file (concat (get-custom-path) "theme_attribute.el"))
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

(tool-bar-mode -1)
(setq x-select-enable-clipboard t) 
(setq indent-tabs-mode t)
(setq tab-width 4)
(setq tab-stop-list ())
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome")
(custom-set-faces
 ;; "DejaVu Sans Mono"
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant oblique :weight normal :height 110 :width normal :foundry "adobe" :family "courier"))))
 '(cursor ((t (:background "white" :foreground "white"))))
 '(linum ((t (:inherit (shadow default) :background "#2e3436" :foreground "#888a85"))))
 '(speedbar-highlight-face ((((class color) (background dark)) (:background "sea green"))))
 '(speedbar-selected-face ((t (:background "#960E10" :foreground "white" :weight bold))))
 )
;; end UI
(provide 'baoduy/ui)
