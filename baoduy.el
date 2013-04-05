(require 'baoduy/cusFunc)
(require 'baoduy/ui)
(require 'baoduy/cui)

;; config my infomation
(setq v_home (equal (getenv "USER") "w34p0n"))
(setq user-mail-address "dbaoduy@gmail.com")
(setq user-full-name "heck_cell")
(defvar  works-mode (getenv "WORK_MODE"))

(if (string= "CEDET" works-mode)
    (progn 
      (print "load cedet space")
      (require 'baoduy/cedet-config)
      )
  (print "Load default space"))

(provide 'baoduy)
