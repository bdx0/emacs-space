(require 'package)

;; config my infomation
(setq v_home (equal (getenv "USER") "w34p0n"))
(setq user-mail-address "dbaoduy@gmail.com")
(setq user-full-name "heck_cell")
(defvar  work-mode (getenv "WORK_MODE"))
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives
	     '("orgmode" . "http://orgmode.org/elpa/"))
(package-initialize)
;; Set up package system
(defvar my-packages
  '(clojure-mode glsl-mode graphviz-dot-mode ido-ubiquitous
    impatient-mode javadoc-lookup js2-mode lua-mode magit markdown-mode
    memoize multiple-cursors nrepl paredit parenface rdp simple-httpd
    skewer-mode smex yasnippet inf-ruby org)
  "A list of packages to ensure are installed at launch.")

(unless package-archive-contents
  (package-refresh-contents))
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
(require 'baoduy/ui)
(require 'baoduy/cui)
(require 'baoduy/cusFunc)

(cond
 ((string= "CEDET" work-mode) 
  (print "load cedet space")
  (require 'baoduy/cedet-config))
 ((string= "C/C++ IDE" work-mode)
  (print "My setup for C/C++ development")
  (require 'baoduy/c-c++-ide-config))
 ((string= "ORG" work-mode) 
  (print "load cedet space")
  (require 'baoduy/org-config))
 ((string= "JAVA" work-mode) 
  (print "load cedet space")
  (require 'baoduy/java-config))
 ((string= "ANDROID" work-mode) 
  (print "load cedet space")
  (require 'baoduy/android-config))
 ((string= "ELISP" work-mode) 
  (print "load cedet space")
  (require 'baoduy/elisp-config))
 ((string= "SCHEME" work-mode) 
  (print "load cedet space")
  (require 'baoduy/scheme-config))
 (t 
  (print "Load default space")
  (server-start))
 )

(provide 'baoduy)
