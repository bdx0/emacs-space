;; ====================
;; config for title bar
(setq frame-title-format
      (list (format "CLOJURE@%s %%S: %%j " (system-name))
	    '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

;; ====================
;; config for cloojure
(add-hook 'clojure-mode-hook 'paredit-mode) ;paradit mode

(provide 'baoduy/clojure-config)
