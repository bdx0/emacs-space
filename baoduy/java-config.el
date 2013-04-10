;; ====================
;; CEDET TOOLS
(load-file (concat baoduy-repo-path "cedet/cedet-devel-load.el"))
(require 'jde)
; Setup Emacs to run bash as its primary shell.
(setq shell-file-name "bash")
(setq shell-command-switch "-c")
(setq explicit-shell-file-name shell-file-name)
(setenv "SHELL" shell-file-name)
(setq explicit-sh-args '("-login" "-i"))
(if (boundp 'w32-quote-process-args)
    (setq w32-quote-process-args ?\")) ;; Include only for MS Windows.


(provide 'baoduy/java-config)
