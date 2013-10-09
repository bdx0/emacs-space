;; (setq debug-on-error t)
(setq message-log-max 16384)
(defconst emacs-start-time (current-time))
(unless noninteractive
  (message "Loading %s..." load-file-name))

(defvar  baoduy-emacs-src 
  (file-name-directory load-file-name) "This is a initialize for my repo")

(defvar user-emacs-directory baoduy-emacs-src)
(let ((default-directory baoduy-emacs-src))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))
(defvar baoduy-repo-path 
  (concat baoduy-emacs-src "repo/") "This is a path0 to my repo path")
;; config my infomation
(require 'package)
(defvar v_home (equal (getenv "USER") "w34p0n"))
(defvar user-mail-address "dbaoduy@gmail.com")
(defvar user-full-name "heck_cell")
(defvar work-mode (getenv "WORK_MODE"))
(defvar user-apps-dir (concat (getenv "HOME") "/tools"))
(defvar user-work-dir (concat (getenv "HOME") "/mydisk/workspace"))

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
(defvar my-packages '(glsl-mode auto-highlight-symbol highlight-symbol
                      graphviz-dot-mode impatient-mode js2-mode lua-mode markdown-mode
                      ido-ubiquitous
                      javadoc-lookup
                      magit
                      memoize
                      multiple-cursors
                      parenface
                      rdp
                      simple-httpd
                      skewer-mode
                      smex
                      yasnippet
                      inf-ruby
                      org org-plus-contrib
                      color-theme
                      clojure-mode clojure-test-mode nrepl paredit
		      company company-cmake pysmell pymacs
                      auto-complete auto-complete-nxml
                      openwith
                      dired+
                      ecb
                      ac-dabbrev ac-geiser ac-helm ac-ja ac-js2 ac-math ac-nrepl ac-slime
		      emacs-eclim
		      e2wm calfw calfw-gcal
		      cmake-mode cmake-project autopair cpputils-cmake
		      use-package)                       
  "A list of packages to ensure are installed at launch.")

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
 '(ecb-options-version "2.40")
 '(find-file-hook (quote (global-linum-mode-check-buffers global-font-lock-mode-check-buffers epa-file-find-file-hook vc-find-file-hook)))
 '(font-use-system-font t)
 '(initial-buffer-choice t)
 '(openwith-associations (quote (("\\.\\(?:\\pdf\\|ps\\|djvu\\)\\'" "okular" (file)) ("\\.\\(?:mpe?g\\|avi\\|wmv\\|mp4\\|mp3\\)\\'" "vlc" (file)) ("\\.\\(?:jp?g\\|png\\)\\'" "gwenview" (file)) ("\\.\\(?:\\doc\\|docx\\|ppt\\|pptx\\|xls\\|xlsx\\|odt\\)\\'" "libreoffice" (file)) ("\\.chm\\'" "kchmviewer" (file)))))
 '(openwith-mode t)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))
(require 'baoduy)
(when window-system
  (let ((elapsed (float-time (time-subtract (current-time)
                                            emacs-start-time))))
    (message "Loading %s...done (%.3fs)" load-file-name elapsed))

  (add-hook 'after-init-hook
            `(lambda ()
               (let ((elapsed (float-time (time-subtract (current-time)
                                                         emacs-start-time))))
                 (message "Loading %s...done (%.3fs) [after-init]"
                          ,load-file-name elapsed)))
            t))
(print "Emacs initialize had finished ::^^::")
(require 'server)
(unless (server-running-p)
  (server-start))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 90 :width normal))))
 '(highlight ((t (:background "gray15"))))
 '(show-paren-match ((t (:background "gray30"))))
 '(show-paren-mismatch ((((class color)) (:background "red" :foreground "white")))))
