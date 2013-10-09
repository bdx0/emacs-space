;; ===================
;; config for eclim mode
(require 'eclim)
(setq eclim-auto-save t) ;; very important
(global-eclim-mode)
(require 'eclimd)
(defvar user-apps-dir (concat (getenv "HOME") "/tools"))

(setq eclim-eclipse-dirs (concat user-apps-dir "/eclipse-eclim"))
(setq eclim-executable (concat eclim-eclipse-dirs "/eclimd"))
(setq eclimd-default-workspace (concat (getenv "HOME") "/mydisk/workspace/java"))
(setq help-at-pt-display-when-idle t)
(setq help-at-pt-timer-delay 0.1)
(help-at-pt-set-timer)

;; ====================
;; config for title bar
(setq frame-title-format
      (list (format "ECLIM@%s %%S: %%j " (system-name))
	    '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

;; add the emacs-eclim source
(require 'ac-emacs-eclim-source)
(ac-emacs-eclim-config)

(provide 'baoduy/eclim-config)
