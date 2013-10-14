;;; dbd-init.el --- Refactory .init.el configuration.

;;; Commentary:
;; system variable
;; some package need to be installed
;; default mode load
;; mapping-mode
;; some customize function
;; config for some extention when come into it's mode.
;; keyboard
;; frame
;; theme
;; start-server
;;;

(eval-when-compile (require 'cl))

;; Your variable or re-assign system variable need for customize
(defconst emacs-start-time (current-time))
(setq message-log-max 16384)
(defvar dbd-emacs-src (file-name-directory load-file-name) "This is a initialize for my repo")q
;; (setq user-emacs-directory dbd-emacs-src) ;customize user-emacs-directory. Default value is "~/.emacs.d"
(setq default-directory dbd-emacs-src)
(add-to-list 'load-path default-directory)
(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
    (normal-top-level-add-subdirs-to-load-path))
(defvar dbd-repo-path (concat dbd-emacs-src "repo/") "This is a path0 to my repo path")
(defvar dbd-is-home (equal (getenv "USER") "w34p0n"))
(defvar dbd-work-mode (getenv "WORK_MODE"))
(defvar user-apps-dir (concat (getenv "HOME") "/tools"))
(defvar user-work-dir (concat (getenv "HOME") "/mydisk/workspace"))
(defvar user-mail-address "dbaoduy@gmail.com")
(defvar user-full-name "heck_cell")

(defvar dbd-dbg nil "set t to turn on debug on error.")
(defun dbd-log(dbd-log)
  (if debug-on-error
      (setq debug-on-error dbd-dbg))
  (print dbd-log)
  )

;; load some dbd-utils
;; load some mode config eval-after-load
;; create some mode not have on emacs

(defun dbd-global-settings ()
  (require 'recentf)
  (dbd-set-title-mode "ORG-MODE")
  (setq make-backup-files nil
	auto-save-default t)
  (autopair-global-mode 1)
  (global-auto-highlight-symbol-mode)
  (add-hook 'prog-mode-hook 'yas-minor-mode)
  (add-hook 'prog-mode-hook 'eldoc-mode)
  (fset 'yes-or-no-p 'y-or-n-p)
  (setq display-time-24hr-format t)
  (global-auto-revert-mode t)
  (desktop-save-mode 1)

  (recentf-mode 1)
  (setq recentf-max-menu-items 25)
  (global-set-key (kbd "C-S-t") 'recentf-open-files) ; similar (define-key global-map <key> <symbol>)
  (ido-mode 1)
  (setq ido-enable-flex-matching t ido-everywhere t
	ido-enable-flex-matching t ido-use-virtual-buffers t)

  (smex-initialize) ; Can be omitted. This might cause a (minimal) delay when Smex is auto-initialized on its first run.

  (global-set-key (kbd "C-c t") 'toggle-transparency)
  (global-set-key [(control f3)] 'highlight-symbol-at-point)
  (global-set-key [f3] 'highlight-symbol-next)
  (global-set-key [(shift f3)] 'highlight-symbol-prev)
  (global-set-key [(meta f3)] 'highlight-symbol-query-replace)
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  ;; This is your old M-x.
  (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
  (global-set-key (kbd "RET") 'newline-and-indent)
  (global-set-key (kbd "C-;") 'comment-or-uncomment-region)
  (global-set-key (kbd "M-/") 'auto-complete)
  (global-set-key (kbd "C-+") 'text-scale-increase)
  (global-set-key (kbd "C--") 'text-scale-decrease)
  (global-set-key (kbd "C-x M-t") 'cleanup-region)
  (global-set-key (kbd "C-c n") 'cleanup-buffer)

  ;; config for dired+
  (setq show-paren-style 'expression)
  (show-paren-mode t)

  (global-set-key  [f1] 'toggle-speed-bar)
  (global-set-key  [f2] (lambda ()  (interactive)(shell)))
  (global-set-key (kbd "C-z") 'undo)
  (global-set-key (kbd "C-S-z") 'redo)
  (global-set-key (kbd "<M-escape>") 'kill-current)
  (global-set-key [S-mouse-2] 'browse-url-at-mouse)
  (global-set-key [C-tab] 'other-window)

  (nav-disable-overeager-window-splitting)
  ;; Optional: set up a quick key to toggle nav
  (global-set-key [f8] 'nav-toggle)

  ;; duplicate a line
  (global-set-key (kbd "C-c d") 'djcb-duplicate-line)
  ;; duplicate a line and comment the first
  (global-set-key (kbd "C-c C-d") (lambda()(interactive)(djcb-duplicate-line t)))

  ;; set keybinding
  (global-set-key (kbd "C-c C-c") 'toggle-comment-line)

  (global-set-key (kbd "M-n") 'move-line-down)
  (global-set-key (kbd "<M-down>") 'move-line-down)

  (global-set-key (kbd "<M-up>") 'move-line-up)
  (global-set-key (kbd "M-p") 'move-line-up)
  ;; yank without leave highlight
  (global-set-key (kbd "<M-w>") 'kill-ring-save-keep-highlight)
  (global-set-key (kbd "M-w") 'kill-ring-save-keep-highlight)
  (setq calendar-hebrew-all-holidays-flag t
	column-number-mode t
	display-time-mode t
	ecb-options-version "2.40"
	find-file-hook (quote (global-linum-mode-check-buffers global-font-lock-mode-check-buffers epa-file-find-file-hook vc-find-file-hook))
	font-use-system-font t
	initial-buffer-choice t
	openwith-associations (quote (("\\.\\(?:\\pdf\\|ps\\|djvu\\)\\'" "okular" (file)) ("\\.\\(?:mpe?g\\|avi\\|wmv\\|mp4\\|mp3\\)\\'" "vlc" (file)) ("\\.\\(?:jp?g\\|png\\)\\'" "gwenview" (file)) ("\\.\\(?:\\doc\\|docx\\|ppt\\|pptx\\|xls\\|xlsx\\|odt\\)\\'" "libreoffice" (file)) ("\\.chm\\'" "kchmviewer" (file))))
	openwith-mode t
	org-agenda-files nil
	uniquify-buffer-name-style (quote forward)
	)

  (defun dbd-load-modes()
    )
  ;; addition for hooks will add right here.
  (defun dbd-custom-hook()
    ;; Toggle to read-only for existing file
    (add-hook 'find-file-hook
	      '(lambda ()
		 (when (and (buffer-file-name)
			    (file-exists-p (buffer-file-name))
			    (file-writable-p (buffer-file-name)))
		   (message "Toggle to read-only for existing file")
		   (toggle-read-only 1))))
    
    )
  (unless noninteractive
    (message "Loading %s..." load-file-name))

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


  (provide 'dbd-init)

;;; dbd-init.el ends here
