;; (setq debug-on-error t)
(defvar  baoduy-emacs-src 
  (file-name-directory load-file-name) "This is a initialize for my repo")
(print baoduy-emacs-src)
(setq user-emacs-directory baoduy-emacs-src)
(let ((default-directory baoduy-emacs-src))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))
(defvar baoduy-repo-path 
  (concat baoduy-emacs-src "repo/") "This is a path to my repo path")
;; config my infomation
(require 'package)
(defvar v_home (equal (getenv "USER") "w34p0n"))
(defvar user-mail-address "dbaoduy@gmail.com")
(defvar user-full-name "heck_cell")
(defvar work-mode (getenv "WORK_MODE"))
(defvar user-apps-dir (concat (getenv "HOME") "/tools"))
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives
	     '("orgmode" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives
	     '("sunrise" . "http://joseito.republika.pl/sunrise-commander/"))
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))

(package-initialize)
;; Set up package system
(defvar my-packages '(glsl-mode
                      graphviz-dot-mode
                      impatient-mode
                      js2-mode
                      lua-mode
                      markdown-mode
                      ido-ubiquitous
                      javadoc-lookup
                      magit
                      memoize
                      multiple-cursors
                      paredit
                      parenface
                      rdp
                      simple-httpd
                      skewer-mode
                      smex
                      yasnippet
                      inf-ruby
                      org
                      color-theme
                      clojure-mode clojure-test-mode nrepl
                      auto-complete auto-complete-nxml
                      openwith
                      dired+
                      ecb
                      ac-dabbrev ac-geiser ac-helm ac-ja ac-js2 ac-math ac-nrepl ac-slime
		      emacs-eclim
		      e2wm calfw calfw-gcal)                       
  "A list of packages to ensure are installed at launch.")

;; starter-kit
;; starter-kit-lisp
;; starter-kit-bindings
;; starter-kit-eshell

(unless package-archive-contents
  (package-refresh-contents))
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(calendar-hebrew-all-holidays-flag t)
 '(column-number-mode t)
 '(display-time-mode t)
 '(find-file-hook (quote (global-linum-mode-check-buffers global-font-lock-mode-check-buffers epa-file-find-file-hook vc-find-file-hook)))
 '(font-use-system-font t)
 '(initial-buffer-choice "~/mydisk/workspace/")
 '(openwith-associations (quote (("\\.\\(?:\\pdf\\|ps\\|djvu\\)\\'" "okular" (file)) ("\\.\\(?:mpe?g\\|avi\\|wmv\\|mp4\\|mp3\\)\\'" "vlc" (file)) ("\\.\\(?:jp?g\\|png\\)\\'" "gwenview" (file)) ("\\.\\(?:\\doc\\|docx\\|ppt\\|pptx\\|xls\\|xlsx\\|odt\\)\\'" "libreoffice" (file)) ("\\.chm\\'" "kchmviewer" (file)))))
 '(openwith-mode t)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))
(require 'baoduy)
(require 'baoduy/ui)
(require 'baoduy/cui)

(print "hello my emacs project ::^^::")
