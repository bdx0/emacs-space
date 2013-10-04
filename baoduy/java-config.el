;; ====================
;; config for title bar
(setq frame-title-format
      (list (format "JAVA@%s %%S: %%j " (system-name))
	    '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

;; ====================
;; config for auto-complete
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories (concat baoduy-repo-path "auto-complete/dict"))
(require 'auto-complete-config)
(global-set-key (kbd "M-RET") 'auto-complete)
(ac-config-default)			;autocomplete config


;; ====================
;; CEDET TOOLS
(load-file (concat baoduy-repo-path "cedet/cedet-devel-load.el"))
;; Enable Semantic
(require 'cedet-m3)
(require 'cedet-compat)
(require 'semantic/senator)
(require 'semantic/canned-configs)
(require 'semantic)
(require 'semantic/lex-spp)
(require 'semantic/decorate/include)
(require 'semantic/ia)
(require 'eassist)
(require 'semantic/db)
(require 'semantic/db-global)
(require 'semantic/ectags/db)
(require 'semantic/db-global)
(require 'semantic/db-javap)
(require 'ede)
(setq semanticdb-javap-classpath (getenv "CLASSPATH"))
;; Enable EDE (Project Management) features
(global-ede-mode 1)

;; Add further minor-modes to be enabled by semantic-mode.
;; See doc-string of `semantic-default-submodes' for other things
;; you can use here.
(add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode t)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-completions-mode t)
(add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode t)
(add-to-list 'semantic-default-submodes 'global-semantic-decoration-mode t)
(add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode t)
(add-to-list 'semantic-default-submodes 'global-semantic-show-parser-state-mode t)
(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode t)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode t)
(add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode t)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-local-symbol-highlight-mode t)
(add-to-list 'semantic-default-submodes 'global-semantic-show-parser-state-mode t)
(add-to-list 'semantic-default-submodes 'global-auto-complete-mode t)
(semantic-mode 1)

(setq ede-project-directories '("/home/w34p0n/mydisk/workspace/cpp"
				"/tmp/test-project"
				"/home/w34p0n/tools/c_dev_el/cedet/lisp"
				"/home/w34p0n/mydisk/project_manage.d/nachos.d/nachos-4.0/code_cus/"))
;; CC-mode
(defun my-cedet-hook ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)
  (local-set-key "\C-c,+" 'senator-fold-tag)
  (local-set-key "\C-c,-" 'senator-unfold-tag)
  (local-set-key "." 'semantic-complete-self-insert)
  (local-set-key ">" 'semantic-complete-self-insert)
  (local-set-key (kbd "RET") 'newline-and-indent)
  (local-set-key "\C-c=" 'semantic-decoration-include-visit)
  (local-set-key "\C-cj" 'semantic-ia-fast-jump)
  (local-set-key "\C-cq" 'semantic-ia-show-doc)
  (local-set-key "\C-cs" 'semantic-ia-show-summary)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)
  (local-set-key "\C-c+" 'semantic-tag-folding-show-block)
  (local-set-key "\C-c-" 'semantic-tag-folding-fold-block)
  (local-set-key "\C-c\C-c+" 'semantic-tag-folding-show-all)
  (local-set-key "\C-c\C-c-" 'semantic-tag-folding-fold-all)
  (add-to-list 'ac-sources 'ac-source-gtags)
  (add-to-list 'ac-sources 'ac-source-semantic)
  (imenu-add-to-menubar "TAGS")
  ;; (setq ac-sources (append '(ac-source-semantic) ac-sources))
  )
(add-hook 'c-mode-common-hook 'my-cedet-hook)
(require 'semantic/imenu)
(require 'srecode)
(setq semantic-imenu-auto-rebuild-directory-indexes 1)
(global-srecode-minor-mode 1)
(global-semantic-mru-bookmark-mode 1)
;; smart completions
(setq-mode-local c-mode semanticdb-find-default-throttle
             '(project unloaded system recursive))
(setq-mode-local c++-mode semanticdb-find-default-throttle
             '(project unloaded system recursive))
(setq-mode-local erlang-mode semanticdb-find-default-throttle
             '(project unloaded system recursive))
(global-semanticdb-minor-mode 1)


;; (require 'jde)
; Setup Emacs to run bash as its primary shell.
(setq shell-file-name "bash")
(setq shell-command-switch "-c")
(setq explicit-shell-file-name shell-file-name)
(setenv "SHELL" shell-file-name)
(setq explicit-sh-args '("-login" "-i"))
(if (boundp 'w32-quote-process-args)
    (setq w32-quote-process-args ?\")) ;; Include only for MS Windows.


(provide 'baoduy/java-config)
