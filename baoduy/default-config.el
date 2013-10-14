;;; default-config.el --- the configuration for default work mode.
;; set default title frame format
;;; Code:

(dbd-set-title-mode "ORG-MODE")

;; ==========================
;; config for org-mode
(defvar dbd-org-data-dir "~/Dropbox/org")
(defun dbd-org-config ()
  (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
  (add-to-list 'Info-additional-directory-list
	       (expand-file-name "/path/to/org-mode/info"))  ;; Info directory
  
  (setq org-modules (append org-modules '(org-bbdb
  					  org-contacts
  					  org-gnus
  					  org-drill
  					  org-info
  					  org-jsinfo
  					  org-habit
  					  org-irc
  					  org-mouse
  					  org-annotate-file
  					  org-eval
  					  org-expiry
  					  org-interactive-query
  					  org-man
  					  org-panel
  					  org-screen
  					  org-toc)))
  (setq org-log-done t)
  (setq org-todo-keywords
	(quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
		(sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING")
		;; (sequence "TODO(t)" "INPROGRESS(i)" "FEEDBACK(f)" "VERIFY(v)" "|" "DONE(d)" "DELEGATED(l)")
		)))

  (setq org-todo-keyword-faces
	(quote (("TODO" :foreground "red" :weight bold)
		("NEXT" :foreground "blue" :weight bold)
		("DONE" :foreground "forest green" :weight bold)
		("WAITING" :foreground "orange" :weight bold)
		("HOLD" :foreground "magenta" :weight bold)
		("CANCELLED" :foreground "forest green" :weight bold)
		("MEETING" :foreground "forest green" :weight bold)
		("PHONE" :foreground "forest green" :weight bold)
		("INPROGRESS" . (:foreground "blue" :weight bold)))))
  (setq org-tag-alist 
	'(
	  (:startgroup)
	  ;; ("@errand" . ?e) ("@tkk" . ?t)
	  ("homet@own" . ?o) ("@home" . ?h) ("@work" . ?w) (:endgroup)
	  (:startgroup) ("RESEARCH" . ?r) ("PLAN" . ?p) ("DESIGN" . ?d) ("IMPLEMENT" . ?i) (:endgroup)
	  (:startgroup) ("TASK" . ?t) ("STORY" . ?s) (:endgroup)
	  (:startgroup) ("BUG" . ?b) ("FEATURE" . ?f) ("IMPROVEMENT" . ?I) (:
	  ("ASSIGMENT" . ?a)
	  ("APPOINTMENT" . ?A)
	  ("PHONE" . ?P)
	  ("BUY" . ?B)
	  ("EMAIL" . ?E))))
  (setq org-directory dbd-org-data-dir)
  ;; (print (dbd-list-dir-with-exclude dbd-org-data-dir   "." ".." ".git" ".gitignore"  ))
  (setq org-agenda-files   (directory-files dbd-org-data-dir nil "\\.org$"))
  (require 'use-package)
  (require 'bind-key)
  (eval-after-load 'org
    '(progn
       (bind-key "C-c r" 'org-capture)
       (bind-key "C-c a" 'org-agenda)
       (bind-key "C-c b" 'org-iswitchb)
       (bind-key "C-c l" 'org-store-link)
       (bind-key "C-c L" 'org-insert-link-global)
       (bind-key "C-c O" 'org-open-at-point-global)
       (bind-key "<f9> <f9>" 'org-agenda-list)
       (bind-key "<f9> <f8>" (lambda () (interactive) (org-capture nil "r")))
       ;; (bind-key "C-TAB" 'org-cycle org-mode-map)
       (bind-key "C-c v" 'org-show-todo-tree org-mode-map)
       (bind-key "C-c C-r" 'org-refile org-mode-map)
       (bind-key "C-c R" 'org-reveal org-mode-map)
       (defun dbd-org-feed-dirs (file) (concat dbd-org-data-dir "/feeds/" file ".org"))
       (setq org-feed-alist
	     '(("Slashdot"
		"http://rss.slashdot.org/Slashdot/slashdot"
		(dbd-org-feed-dirs "feed")
		"Slashdot Entries")
	       ("Julien Danjou"
		"http://julien.danjou.info/blog/index.xml"
		(dbd-org-feed-dirs "feed")
		"Julien Danjou Entries")
	       ("Emacs wiki"
		"http://www.emacswiki.org/emacs/?action=rss;match=%5E%5Cd%5Cd%5Cd%5Cd-%5Cd%5Cd-%5Cd%5Cd"
		(dbd-org-feed-dirs "feed")
		"Emacs wiki entries")
	       ))
       (setq org-default-notes-file (concat org-directory "/notes.org"))
       (setq org-capture-templates
	     (quote (("t" "todo" entry (file (concat org-directory "/mygtd.org"))
		      "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
		     ("n" "note" entry (file (concat org-directory "/mygtd.org"))
		      "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
		     ("j" "Journal" entry (file+datetree (concat org-directory "/diary.org"))
		      "* %?\n%U\n" :clock-in t :clock-resume t)
		     )))
       (setq org-agenda-custom-commands 
	     '(("w" todo "WAITING" nil) 
	       ("n" todo "NEXT" nil)
	       ("d" "Agenda + Next Actions" ((agenda) (todo "NEXT")))
	       ("P" "Project List"((tags "PROJECT")))
	       ("O" "Office" ((agenda) (tags-todo "OFFICE")))
	       ("W" "Weekly Plan" ((agenda) (todo "TODO") (tags "PROJECT")))
	       ("H" "Home NA Lists" ((agenda) (tags-todo "HOME") (tags-todo "COMPUTER"))))
	     )
       (setq org-archive-location (concat org-directory "archive/%s_archive::"))
       ))
  ;; config for Internet Rely Chat
  (use-package erc
    :config
    (setq erc-autojoin-channels-alist '(("freenode.net"
					 "#org-mode"
					 "#hacklabto"
					 "#Emacs"))
	  erc-server "irc.freenode.net"
	  erc-nick "dbaoduy"))
  ;; config for org agenda
  (setq org-agenda-span 2)
  (setq org-agenda-show-log t)
  (setq org-agenda-skip-scheduled-if-done t)
  (setq org-agenda-skip-deadline-if-done t)
  (setq org-agenda-time-grid
	'((daily today require-timed)
	  "----------------"
	  (800 1000 1200 1400 1600 1800)))
  (setq org-columns-default-format "%50ITEM %12SCHEDULED %TODO %3PRIORITY %Effort{:} %TAGS")
  ;; links abbrev for search engine
  (setq org-link-abbrev-alist
	'(("bugzilla"  . "http://10.1.2.9/bugzilla/show_bug.cgi?id=")
	  ("url-to-ja" . "http://translate.google.fr/translate?sl=en&tl=ja&u=%h")
	  ("google"    . "http://www.google.com/search?q=")
	  ("gmap"      . "http://maps.google.com/maps?q=%s")
	  ("omap"      . "http://nominatim.openstreetmap.org/search?q=%s&polygon=1")
	  ("ads"       . "http://adsabs.harvard.edu/cgi-bin/nph-abs_connect?author=%s&db_key=AST")))
  )

(defun gtd ()
   (interactive)
   (find-file (expand-file-name "mygtd.org" dbd-org-data-dir))
)
(defun dbd-org2blog-config ()
  (dbd-org-config)
  (require 'org2blog-autoloads)
  (require 'netrc)
  ;; org2blog config
  (setq auth (netrc-machine (netrc-parse "~/.netrc") "myblog"))
  (setq org2blog/wp-blog-alist '(("myblog"
				  :url "https://baoduyduong0206.wordpress.com/xmlrpc.php"
				  :username (netrc-get auth "login")
				  :password (netrc-get auth "password")
				  :default-title "Unitiled"
				  :default-categories ("org-world" "emacs")
				  :tags-as-categories nil)))
  (setq org2blog/wp-buffer-template
	"# -*- mode: org; fill-column: 90 -*-
#+DATE: %s
#+OPTIONS: toc:t num:t todo:nil pri:nil tags:nil ^:t TeX:nil
#+CATEGORY: %s
#+TAGS:
#+DESCRIPTION:
#+TITLE: %s\n\n")
  
  (setq xml-entity-alist
	'(("lt"   . "&#60;")
	  ("lt"   . "<")
	  ("gt"   . ">")
	  ("apos" . "'")
	  ("quot" . "\"")
	  ("amp"   . "&#38;")
	  ("amp"  . "&")
	  ))  ;; fix xml-rpc for org2blog
  (add-hook 'org-mode-hook 'org2blog/wp-mode)
  )

(dbd-org2blog-config)
(provide 'baoduy/default-config)
;;; default-config.el ends here
