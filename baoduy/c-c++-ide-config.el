(require 'cmake-project)
(require 'cmake-mode)
(setq auto-mode-alist
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)
		("\\.cmake\\'" . cmake-mode))
	      auto-mode-alist))
(add-hook 'cmake-mode-hook (lambda () (print "use to test autoload when cmake-mode-hook run.")))
;; ====================
;; config for title bar
(setq frame-title-format
      (list (format "C/C++ IDE@%s %%S: %%j " (system-name))
	    '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))
;; ===================
;; For C/C++ mode
(global-set-key [f9] 'compile)
;; this is setting is only for C/C++ process
(setq ac-auto-start nil)
(setq ac-quick-help-delay 1.5)
(autoload 'gid "idutils" nil t)

;;; activate ecbn
(require 'ecb)
(require 'ecb-autoloads)
(global-set-key (kbd "<f4>") 'ecb-activate)
(global-set-key (kbd "<M-f4>") 'ecb-deactivate)
(require 'auto-complete-clang)
(defun ac-cc-mode-setup ()
  (ac-add-sources '(ac-source-clang ac-source-abbrev
				    ac-source-gtags
				    ac-source-semantic
				    ac-source-dictionary
				    ac-source-yasnippet
				    ac-source-words-in-all-buffer)
				    t))

(setq ac-clang-flags (mapcar (lambda (item)(concat "-I" item))
			      (split-string
			       "/usr/include/c++/4.6
 /usr/include/c++/4.6/x86_64-linux-gnu/
 /usr/include/c++/4.6/backward
 /usr/lib/gcc/x86_64-linux-gnu/4.6/include
 /usr/local/include
 /usr/lib/gcc/x86_64-linux-gnu/4.6/include-fixed
 /usr/include/x86_64-linux-gnu
 /usr/include
" )))
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
(find-file (concat user-work-dir "/cpp"))
(provide 'baoduy/c-c++-ide-config)
