;; set default title frame format
(setq frame-title-format
      (list (format "COMMON@%s %%S: %%j " (system-name))
	    '(buffer-file-name "%f" (dired-directory
				     dired-directory "%b"))))
(setq make-backup-files nil
      auto-save-default t)
;; ==========================
;; config for org-mode
(require 'org)
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
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
      '((sequence "TODO" "INPROGRESS" "FEEDBACK" "VERIFY" "|" "DONE" "DELEGATED")))
(setq org-todo-keyword-faces
      '(("INPROGRESS" . (:foreground "blue" :weight bold))))
(defvar dbd-org-data-dir "~/Dropbox/org/")
(setq
 org-agenda-files (mapcar (lambda (x) (concat dbd-org-data-dir
					      x)) (nthcdr
						   2 (directory-files (expand-file-name dbd-org-data-dir)))))

(require 'use-package)
(require 'bind-key)
(bind-key "C-c r" 'org-capture)
(bind-key "C-c a" 'org-agenda)
(bind-key "C-c l" 'org-store-link)
(bind-key "C-c L" 'org-insert-link-global)
(bind-key "C-c O" 'org-open-at-point-global)
(bind-key "<f9> <f9>" 'org-agenda-list)
(bind-key "<f9> <f8>" (lambda () (interactive) (org-capture nil "r")))
(eval-after-load 'org
 '(progn
    (bind-key "C-TAB" 'org-cycle org-mode-map)
    (bind-key "C-c v" 'org-show-todo-tree org-mode-map)
    (bind-key "C-c C-r" 'org-refile org-mode-map)
    (bind-key "C-c R" 'org-reveal org-mode-map)))
;; config for Internet Rely Chat
(use-package erc
	     :config
	     (setq erc-autojoin-channels-alist '(("freenode.net"
						  "#org-mode"
						  "#hacklabto"
						  "#emacs"))
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
(provide 'baoduy/default-config)
