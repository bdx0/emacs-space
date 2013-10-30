;; ====================
(defun dbd-java-cedet-mode-config ()
  (require 'cedet)
  (require 'ede)
  (require 'jde)
  ;; Enable Semantic
  (setq jde-global-classpath (split-string (getenv "CLASSPATH")))
  ;; Enable EDE (Project Management) features
  (global-ede-mode 1)
  (semantic-load-enable-code-helpers)
  (setq jde-check-version-flag nil)
  (setq jde-compile-option-directory
	(concat (getenv "HOME") "/tmp"))

  ;; (require 'gtags)
  ;; (autoload 'gtags-mode "gtags" "" t)
  ;; (setq gtags-suggested-key-mapping t)
  ;; (global-set-key (kbd "C-c C-f") 'gtags-find-file)
  ;; (add-hook 'gtags-select-mode-hook
  ;; 	    '(lambda ()
  ;; 	       (setq hl-line-face 'underline)
  ;; 	       (hl-line-mode 1)))
  ;; (require 'gud)
  ;; (defun java-my-minor ()
  ;;   (progn
  ;;     (gtags-mode t)
  ;;     (glasses-mode t)
  ;;     (auto-complete-mode t)
  ;;     (add-to-list 'ac-sources ac-source-gtags)
  ;;     (local-set-key [f8] 'gud-next)
  ;;     (local-set-key [f9] 'gud-cont)
  ;;     (local-set-key (kbd "M-/") 'hippie-expand)
  ;;     (local-set-key (kbd "C-c C-v .") 'jde-complete-minibuf)
  ;;     (add-hook 'before-save-hook
  ;; 		(lambda ()
  ;; 		  (jde-import-kill-extra-imports)
  ;; 		  (jde-import-all)
  ;; 		  (jde-import-organize))
  ;; 		nil t)
  ;;     (add-hook 'after-save-hook 'jde-compile nil t)))
  ;; (add-hook 'jde-mode-hook 'java-my-minor)

  ;; Add further minor-modes to be enabled by semantic-mode.
  ;; See doc-string of `semantic-default-submodes' for other things
  ;; you can use here.


					; Setup Emacs to run bash as its primary shell.
  (setq shell-file-name "bash")
  (setq shell-command-switch "-c")
  (setq explicit-shell-file-name shell-file-name)
  (setenv "SHELL" shell-file-name)
  (setq explicit-sh-args '("-login" "-i"))
  (if (boundp 'w32-quote-process-args)
      (setq w32-quote-process-args ?\")) ;; Include only for MS Windows.
  )

(defun dbd-java-malabar-mode-config ()
  (require 'cedet)
  (require 'semantic)
  ;; (semantic-load-enable-minimum-features) ;; or enable more if you wish
  (setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
				    global-semanticdb-minor-mode
				    global-semantic-idle-summary-mode
				    global-semantic-mru-bookmark-mode))
  (semantic-mode 1)
  (require 'malabar-mode)
  (setq malabar-groovy-lib-dir (expand-file-name "~/tools/emacs-space/repo/malabar-mode/src/gro")
	malabar-load-source-from-sibling-projects t)
  
  (add-to-list 'auto-mode-alist '("\\.java\\'" . malabar-mode))
  (global-set-key "\C-\M-g" 'malabar-jump-to-thing)
  (global-set-key "\M-n" 'semantic-ia-complete-symbol)
  (add-hook 'malabar-mode-hook
	    (lambda () 
	      (add-hook 'after-save-hook 'malabar-compile-file-silently
			nil t)))
  (require 'compile)
  (setq compilation-error-regexp-alist
	(append (list
		 ;; works for jikes
		 '("^\\s-*\\[[^]]*\\]\\s-*\\(.+\\):\\([0-9]+\\):\\([0-9]+\\):[0-9]+:[0-9]+:" 1 2 3)
		 ;; works for javac
		 '("^\\s-*\\[[^]]*\\]\\s-*\\(.+\\):\\([0-9]+\\):" 1 2)
		 ;; works for maven 2.x
		 '("^\\(.*\\):\\[\\([0-9]*\\),\\([0-9]*\\)\\]" 1 2 3)
		 ;; works for maven 3.x
		 '("^\\(\\[ERROR\\] \\)?\\(/[^:]+\\):\\[\\([0-9]+\\),\\([0-9]+\\)\\]" 2 3 4)
		 '("^\\(\\[WARNING\\] \\)?\\(/[^:]+\\):\\[\\([0-9]+\\),\\([0-9]+\\)\\]" 2 3 4)
		 )
		compilation-error-regexp-alist))
  )

(defun dbd-java-mode-config ()
  (interactive)
  (dbd-java-cedet-mode-config)
  ;; (dbd-java-malabar-mode-config)
  )

(dbd-java-mode-config)

(provide 'baoduy/java-config)
