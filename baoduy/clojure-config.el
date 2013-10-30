;; ====================
;; config for cloojure
(require 'clojure-mode)
(require 'cider)
(require 'paredit)
(add-hook 'clojure-mode-hook 'paredit-mode) ;paradit mode
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

(provide 'baoduy/clojure-config)
