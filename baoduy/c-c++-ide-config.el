;; ====================
;; config for title bar
(setq frame-title-format
      (list (format "C/C++ IDE@%s %%S: %%j " (system-name))
	    '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))
;; ===================
;; For C/C++ mode
(global-set-key [f9] 'compile)
(defun setting-for-c-mode () 
  
  )

(add-hook 'c-mode-common-hook 'setting-for-c-mode)
       

(provide 'baoduy/c-c++-ide-config)
