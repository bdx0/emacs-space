;; ====================
;; config for title bar
(setq frame-title-format
      (list (format "CLOJURE@%s %%S: %%j " (system-name))
	    '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))
;; ====================
;; config for auto-complete
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories (concat baoduy-repo-path "auto-complete/dict"))
(require 'auto-complete-config)
(global-set-key (kbd "M-RET") 'auto-complete)
(ac-config-default)			;autocomplete config


;; ====================
;; config for cloojure
(add-hook 'clojure-mode-hook 'paredit-mode) ;paradit mode

(provide 'baoduy/clojure-config)
