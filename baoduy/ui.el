;; UI
(print "load ui.el")
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
;; end UI
(provide 'baoduy/ui)
