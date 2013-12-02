;; 
;;
;;
;;
;;
;;
;; 
(setq debug-on-error t)

(setq message-log-max 16384)
(defconst emacs-start-time (current-time))
(unless noninteractive
  (message "Loading %s..." load-file-name))

(defvar  baoduy-emacs-src 
  (file-name-directory load-file-name) "This is a initialize for my repo")

(defvar user-emacs-directory baoduy-emacs-src)
(let ((default-directory baoduy-emacs-src))
  (load-file (expand-file-name  "~/.emacs.d/repo/jde/cedet-1.1/common/cedet.el"))
  (setq dbd-first-load-path (mapcar (lambda (x) (expand-file-name x)) '("repo/org-mode/lisp" "repo/org-mode/contrib/lisp")))
  (setq load-path (append dbd-first-load-path load-path))
  (add-to-list 'load-path default-directory )
  (normal-top-level-add-subdirs-to-load-path)
  )

(let ((path-from-shell "/usr/local/Library/ENV/4.3:/usr/local/opt/autoconf/bin:/usr/local/opt/automake/bin:/usr/local/opt/pkg-config/bin:/usr/bin:/bin:/usr/sbin:/sbin:/private/tmp/emacs-4uFz/emacs-24.3/lib-src:/usr/local/Cellar/emacs/24.3/libexec/emacs/24.3/x86_64-apple-darwin13.0.0:/Applications/Apps/Emacs.app/Contents/MacOS:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Users/duongbaoduy/app/android-tools/sdk/tools:/Users/duongbaoduy/app/android-tools/sdk/platform-tools:/opt/local/bin:/opt/X11/bin:/Users/duongbaoduy/bin:/usr/local/bin")) ;;(shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
  (setenv "PATH" path-from-shell)
  (setq exec-path (append exec-path (split-string path-from-shell path-separator))))

(defvar baoduy-repo-path 
  (concat baoduy-emacs-src "repo/") "This is a path0 to my repo path")
;; config my infomation
(defvar v_home (equal (getenv "USER") "w34p0n"))
(defvar user-mail-address "dbaoduy@gmail.com")
(defvar user-full-name "heck_cell")
(defvar work-mode (getenv "WORK_MODE"))
(defvar user-apps-dir (concat (getenv "HOME") "/tools"))
(defvar user-work-dir (concat (getenv "HOME") "/mydisk/workspace"))
(defvar dbd-dbg nil "set t to turn on debug on error.")
(defun dbd-log(dbd-log)
  (if debug-on-error
      (setq debug-on-error dbd-dbg))
  (print dbd-log)
  )
(defvar dbd-system-type 0 "running system type")
(cond
 ((string-equal system-type "windows-nt") ; Microsoft Windows
  (progn
    (setq dbd-system-type 1)
    (message "Microsoft Windows") )
  )
 ((string-equal system-type "darwin")   ; Mac OS X
  (progn
    (setq dbd-system-type 2)
    (message "Mac OS X")
    )
  )
 ((string-equal system-type "gnu/linux") ; linux
  (progn
    (setq dbd-system-type 0)
    (message "Linux") )
  )
 )
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives
	     '("orgmode" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives
	     '("sunrise" . "http://joseito.republika.pl/sunrise-commander/"))
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))

(package-initialize)
;; auto-highlight-symbol
;; Set up package system
(defvar  my-packages '(glsl-mode  highlight-symbol
				  graphviz-dot-mode impatient-mode js2-mode lua-mode markdown-mode
				  ido-ubiquitous
				  javadoc-lookup
				  magit
				  slime
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
				  org-jekyll
				  org2blog
				  color-theme
				  clojure-mode clojure-test-mode nrepl cider
				  company company-cmake pysmell pymacs
				  auto-complete auto-complete-nxml
				  openwith
				  dired+
				  ecb
				  ac-dabbrev ac-geiser ac-helm ac-ja ac-js2 ac-math ac-nrepl ac-slime
				  emacs-eclim
				  e2wm calfw calfw-gcal
				  cmake-mode cmake-project autopair cpputils-cmake
				  use-package
				  gtags)
  "A list of packages to ensure are installed at launch.")

(unless package-archive-contents
  (package-refresh-contents))
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
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
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 90 :width normal))))
;;  '(highlight ((t (:background "gray15"))))
;;  '(show-paren-match ((t (:background "gray30"))))
;;  '(show-paren-mismatch ((((class color)) (:background "red" :foreground "white")))))
;; (put 'narrow-to-region 'disabled nil)
