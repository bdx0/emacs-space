(require 'baoduy/load-package)
(require 'baoduy/misc-func)
(require 'baoduy/cusKey)

;; =======================================================
;; config for Autocomplete
;; =======================================================
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories (concat baoduy-repo-path "auto-complete/dict"))
(require 'auto-complete-config)
(dolist (mode '(magit-log-edit-mode log-edit-mode org-mode text-mode haml-mode
                sass-mode yaml-mode csv-mode espresso-mode haskell-mode
                html-mode nxml-mode sh-mode smarty-mode clojure-mode
                lisp-mode textile-mode markdown-mode tuareg-mode
                js3-mode css-mode less-css-mode sql-mode ielm-mode cmake-mode c-mode-common-hook java-mode))
  (add-to-list 'ac-modes mode))
(autopair-global-mode 1)
(global-auto-highlight-symbol-mode)
(add-hook 'prog-mode-hook 'yas-minor-mode)

;; load customize for each work-mode
(cond
 ((string= "CEDET" work-mode) 
  (print "load cedet space")
  (require 'baoduy/cedet-config))
 ((string= "C/C++ IDE" work-mode)
  (print "My setup for C/C++ development")
  (require 'baoduy/c-c++-ide-config))
 ((string= "ORG" work-mode) 
  (print "load cedet space")
  (require 'baoduy/org-config))
 ((string= "JAVA" work-mode) 
  (print "load JAVA IDE space")
  (require 'baoduy/java-config))
 ((string= "ECLIM" work-mode) 
  (print "load ECLIM IDE space")
  (require 'baoduy/eclim-config))
 ((string= "ANDROID" work-mode) 
  (print "load cedet space")
  (require 'baoduy/android-config))
 ((string= "ELISP" work-mode) 
  (print "load cedet space")
  (require 'baoduy/elisp-config))
 ((string= "SCHEME" work-mode) 
  (print "load cedet space")
  (require 'baoduy/scheme-config))
 ((string= "CLOJURE" work-mode)
  (print "My setup for clojure environment")
  (require 'baoduy/clojure-config))
 (t 
  (print "Load default space")
  (require 'baoduy/default-config)
  ))

(ac-config-custom)
(require 'baoduy/ui)
(require 'baoduy/cui)
(provide 'baoduy)
