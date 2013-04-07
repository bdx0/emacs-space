;; =======================================================
;; config for Autocomplete
;; =======================================================
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories (concat baoduy-repo-path "auto-complete/dict"))
(require 'auto-complete-config)
(global-set-key (kbd "M-RET") 'auto-complete)
(ac-config-default)			;autocomplete config


(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; ====================
;; config for yasnippet
(require 'yasnippet)
(yas-global-mode 1)
(require 'dropdown-list)
(setq yas-prompt-functions '(yas-dropdown-prompt
			     yas-ido-prompt
			     yas-completing-prompt))
;; ====================
;; config for title bar
(setq frame-title-format
      (list (format "CEDET@%s %%S: %%j " (system-name))
	    '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

;; ====================
;; CEDET TOOLS
(load-file (concat baoduy-repo-path "cedet/cedet-devel-load.el")) 
;; Enable Semantic
(require 'semantic)
(require 'semantic/lex-spp)
(require 'semantic/decorate/include)
(require 'semantic/ia)
(require 'eassist)
(require 'semantic/db)
(require 'semantic/db-global)
(require 'semantic/ectags/db)
(require 'semantic/db-global)
(require 'ede)
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
;; (semantic-load-enable-excessive-code-helpers)
;; (semantic-load-enable-semantic-debugging-helpers)
(setq senator-minor-mode-name "SN")
(setq semantic-imenu-auto-rebuild-directory-indexes 1)
(global-srecode-minor-mode 1)
(global-semantic-mru-bookmark-mode 1)
;; gcc setup
;; (require 'semantic/gcc)
;; smart completions
(setq-mode-local c-mode semanticdb-find-default-throttle
             '(project unloaded system recursive))
(setq-mode-local c++-mode semanticdb-find-default-throttle
             '(project unloaded system recursive))
(setq-mode-local erlang-mode semanticdb-find-default-throttle
             '(project unloaded system recursive))
(global-semanticdb-minor-mode 1)
;; gnu global support
(semanticdb-enable-gnu-global-databases 'c-mode)
(semanticdb-enable-gnu-global-databases 'c++-mode)
;; ctags
(semantic-load-enable-primary-ectags-support)
;; (global-semantic-tag-folding-mode)
;(concat essist-header-switches ("hh" "cc"))
(defun alexott/c-mode-cedet-hook ()
  (local-set-key "\C-ct" 'eassist-switch-h-cpp)
  (local-set-key "\C-xt" 'eassist-switch-h-cpp)
  (local-set-key "\C-ce" 'eassist-list-methods)
  (local-set-key "\C-c\C-r" 'semantic-symref)
  )
(add-hook 'c-mode-common-hook 'alexott/c-mode-cedet-hook)
 
;; gnu global support
(semanticdb-enable-gnu-global-databases 'c-mode)
(semanticdb-enable-gnu-global-databases 'c++-mode)
;; (global-semantic-idle-tag-highlight-mode 1
;; (require 'ecb)
;; (require 'ecb-autoloads)	
;; (ecb-activate)				
;; ui 


;; end CEDET TOOLS
;; ====================
;; Config for EDE Projects
(ede-enable-generic-projects)
(ede-cpp-root-project
  "myserver"
  :file "/home/w34p0n/mydisk/workspace/cpp/myserver/README"
  :include-path '("/"
		  "/include")
  :spp-table '(("MOOSE" . "")
		("CONST" . "const"))
  )
;; end Config
(provide 'baoduy/cedet-config)
