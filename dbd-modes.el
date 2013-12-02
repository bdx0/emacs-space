;;; dbb-modes.el --- define function for dbd-modes.

;;; Commentary:
;;

(eval-when-compile (require 'cl))

(defun dbd-org2blog-mode ()
  "This function use to run org2blog in the new process with org2blog."
  (setenv "WORK_MODE" "ORG2BLOG")
  (start-process "ORG2BLOG" "*ORG2BLOG*" "emacs" (expand-file-name "blogs/index.org" dbd-org-data-dir)))

(defun dbd-default-mode()
  "only load new frame"
  (new-frame))

(setenv "INSTANCE" "1")

(defun dbd-ec-new()
  "Create new instance of default mode."
  (setq dbd-emacs-instance (+ (string-to-number (getenv "INSTANCE")) 1))
  (setenv "INSTANCE" (number-to-string dbd-emacs-instance))
  (setenv "WORK_MODE" (concat "Instance-" (number-to-string dbd-emacs-instance)))
  (start-process "NEW" "*NEW*" "emacs")
  )

(defun dbd-c-cpp-mode ()
  "This function use to run C/C++ IDE on other process"
  (setenv "WORK_MODE" "C/C++ IDE")
  (start-process "C/CPP-IDE" "*C/CPP-IDE*" "emacs"))

(defun dbd-java-mode ()
  "This function call JAVA IDE process"
  (setenv "WORK_MODE" "JAVA")
  (start-process "JAVA IDE" "*JAVA IDE*" "emacs" "--debug-init" "-q" "-l" "~/tools/emacs-space/init.el")
  )

(defun dbd-eclim-mode ()
  "This function use to run ECLIM IDE on other process"
  (setenv "WORK_MODE" "ECLIM")
  (start-process "ECLIM IDE" "*ECLIM IDE*" "emacs" "--debug-init"))

(defun dbd-clojure-mode ()
  "This function use to run CLOJURE IDE on other process"
  (interactive)
  (setenv "WORK_MODE" "CLOJURE")
  (start-process "CLOJURE IDE" "*CLOJURE IDE*" "emacs" "--debug-init"))


;; will change locate to other place. all modified auto-mode-alist at here.
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; =========================
;; mode mapping from ...
;; =========================
;; YAML
(autoload 'yaml-mode "yaml-mode")
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("jsTestDriver\\.conf$" . yaml-mode))

;; Emacs lisp
(add-to-list 'auto-mode-alist '("Carton$" . emacs-lisp-mode))

;; CSS
(add-to-list 'auto-mode-alist '("\\.scss$" . css-mode))

;; Restclient
(add-to-list 'auto-mode-alist '("\\.restclient$" . restclient-mode))

;; Cucumber
(autoload 'feature-mode "feature-mode")
(add-to-list 'auto-mode-alist '("\\.feature$" . feature-mode))

;; Adventur
(autoload 'adventur-mode "adventur-mode")
(add-to-list 'auto-mode-alist '("\\.adv$" . adventur-mode))

;; Jade and Stylus (sws = significant whitespace)
(autoload 'sws-mode "sws-mode")
(autoload 'jade-mode "jade-mode")
(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))

;; HTML
(add-to-list 'auto-mode-alist '("\\.html\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.tag$" . html-mode))
(add-to-list 'auto-mode-alist '("\\.vm$" . html-mode))
;; (add-hook 'sgml-mode-hook
;;           (lambda ()
;;             (require 'rename-sgml-tag)
;;             (define-key sgml-mode-map (kbd "C-c C-r") 'rename-sgml-tag)))

;; RevealJS slide sets
(add-hook 'sgml-mode-hook
          (lambda ()
            (save-excursion
              (if (search-forward "class=\"reveal\"" nil t)
                  (progn
                    (require 'revealjs-mode)
                    (revealjs-mode))))))

;; JSP
(autoload 'crappy-jsp-mode "crappy-jsp-mode")
(add-to-list 'auto-mode-alist '("\\.jsp$" . crappy-jsp-mode))
(add-to-list 'auto-mode-alist '("\\.jspf$" . crappy-jsp-mode))

;; Ruby
(autoload 'rhtml-mode "rhtml-mode")
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.watchr$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("capfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.erb$" . rhtml-mode))

;; Puppet
(autoload 'puppet-mode "puppet-mode")
(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))

;; Groovy
(autoload 'groovy-mode "groovy-mode")
(add-to-list 'auto-mode-alist '("\\.groovy$" . groovy-mode))

;; Clojure
(autoload 'clojure-mode "clojure-mode")
(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))

;; SVG
(add-to-list 'auto-mode-alist '("\\.svg$" . image-mode))

;; JavaScript
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . javascript-mode))
(add-to-list 'auto-mode-alist '("\\.jshintrc$" . javascript-mode))
(add-to-list 'magic-mode-alist '("#!/usr/bin/env node" . js2-mode))

;; Configuration files
(add-to-list 'auto-mode-alist '("\\.offlineimaprc$" . conf-mode))

;; Snippets
(add-to-list 'auto-mode-alist '("yasnippet/snippets" . snippet-mode))
(add-to-list 'auto-mode-alist '("\\.yasnippet$" . snippet-mode))

;; Buster.JS
;(autoload 'buster-mode "buster-mode")
;(setq buster-node-executable "/usr/local/bin/node")
;(add-file-find-hook-with-pattern "test\\.js$" (lambda () (buster-mode)) "require(\\(\"\\|'\\)buster")

;; Markdown
(autoload 'markdown-mode "markdown-mode")
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.m(ark)?down$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
(add-hook 'markdown-mode-hook (lambda () (define-key markdown-mode-map (kbd "<tab>") 'yas/expand)))

;; Highlighting in editmsg-buffer for magit
(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG" . conf-javaprop-mode))

;; Apache config
(autoload 'apache-mode "apache-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.htaccess\\'"   . apache-mode))
(add-to-list 'auto-mode-alist '("httpd\\.conf\\'"  . apache-mode))
(add-to-list 'auto-mode-alist '("srm\\.conf\\'"    . apache-mode))
(add-to-list 'auto-mode-alist '("access\\.conf\\'" . apache-mode))
(add-to-list 'auto-mode-alist '("sites-\\(available\\|enabled\\)/" . apache-mode))

(provide 'dbd-modes)

;;; dbb-modes.el ends here
