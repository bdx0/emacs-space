;;; misc-func.el --- some elisp utils, that collect from internet.
;; TODO  create test case for this misc-func.el

;;; Commentary:
;; 

;;; Code:

(eval-when-compile (require 'cl))

(defun toggle-transparency ()
  (interactive)
  (if (/=
       (cadr (frame-parameter nil 'alpha))
       100)
      (set-frame-parameter nil 'alpha '(100 100))
    (set-frame-parameter nil 'alpha '(70 50))))

(defun dbd-set-title-mode (dbd-mode)
  (setq frame-title-format
      (list (format "%s@%s %%S: %%j " dbd-mode (system-name))
            '(buffer-file-name "%f" (dired-directory
                                     dired-directory "%b"))))
  )

(defun find-last-killed-file ()
  (interactive)
  (let ((active-files (loop for buf in (buffer-list)
                            when (buffer-file-name buf) collect it)))
    (loop for file in recentf-list
          unless (member file active-files) return (find-file file))))

(defun dbd-add-to-push-queue ()
  "Add the file associated with the current buffer to post queue in
push-queue.org"
  (interactive)
  (let ((file (buffer-file-name)))
    (when (null file)
      (error "Buffer not associated with file."))
    (find-file "/Users/jcs/org/blog/push-queue.org")
    (beginning-of-buffer)
    (if (search-forward-regexp "^\\* Ready to Post")
        (progn
          (forward-line)
          (org-end-of-item-list)
          (insert (format "- [ ] [[%s][%s]]\n" file (file-name-base file)))
          (org-update-statistics-cookies 'all))
      (error "Missing top-level header."))))
(defun kill-ring-save-keep-highlight (beg end)
  "Keep the region active after the kill."
  (interactive "r")
  (prog1 (kill-ring-save beg end)
    (setq deactivate-mark nil)))

(defun show-info-at-point ()
  "This function get the curent word at ponter. Then, find manual entry (man page) for this word."
  (interactive)
  (manual-entry (current-word))
  )

(defun dbd-delete (x l &optional f)
  "This function is not good as delete written in C source code. It throw error \"Stack overflow at equal\" when run with `find-file command"
  (if l
      (if f
	  (if (funcall  f (car l) x)
	      (cdr l)
	    (cons (car l)
		  (dbd-delete x (cdr l) f)))
	(if (eq (car l) x)
	    (cdr l)
	  (cons (car l)
		(dbd-delete x (cdr l))))		   
	)))

(defun dbd-list-dir-with-exclude (dir &rest exclude-files)
  (mapcar
   (lambda (x) (concat dir x))
   (let ((ptr exclude-files)
	 (files-name (directory-files (expand-file-name
				       dir))))
     (while ptr
       (progn
	 (setq ptr (cdr ptr))
	 (setq files-name (dbd-delete (car ptr) files-name 'equal))))
     files-name
     )))

(defun dbd-find-grep ()
  (setq grep-find-command
	"grep -rnH --exclude=.hg --include=\*.{c,cpp,h} --include=-e 'pattern' ~/src_top/*")
  )

(defun toggle-speed-bar (&optional arg)
  (interactive)
  (speedbar t)
  )

(defun ac-config-custom ()
  "This function make a custom config for auto-complete package."
  (ac-add-sources '(ac-source-abbrev
		    ac-source-dictionary ac-source-yasnippet
		    ac-source-features ac-source-words-in-all-buffer
		    ) t)
  (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
  (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
  (add-hook 'css-mode-hook 'ac-css-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))

(defun ac-add-sources (sources &optional is-clear-before)
  "This function add more a list source in ac-sources."
  (cond (is-clear-before
	 ;; (message "reset ac-sources")
	 (setq ac-sources '())))		;clear ac-source if is-clear-before boundp
  (setq ac-sources (append ac-sources sources)))

(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer."
  (interactive)
  (indent-buffer)
  (untabify-buffer)
  (delete-trailing-whitespace))

(defun cleanup-region (beg end)
  "Remove tmux artifacts from region."
  (interactive "r")
  (dolist (re '("\\\\│\·*\n" "\W*│\·*"))
    (replace-regexp re "" nil beg end)))

(defun run-CEDET-other-process ()
  "This function use to run CEDET & Emacs on other process"
  (setenv "WORK_MODE" "CEDET")
  ;; (call-process "emacs" nil nil nil "&")
  (start-process "CEDET" "*Messages*" "emacs"))

(defun run-C-C++-IDE-other-process ()
  "This function use to run C/C++ IDE on other process"
  (setenv "WORK_MODE" "C/C++ IDE")
  ;; (call-process "emacs" nil nil nil "&")
  (start-process "C/C++ IDE" "*Messages*" "emacs"))

(defun run-JAVA-IDE-other-process ()
  "This function use to run JAVA IDE on other process"
  (setenv "WORK_MODE" "JAVA")
  (start-process "JAVA IDE" "*Messages*" "emacs" "--debug-init"))

(defun run-CLOJURE-IDE-other-process ()
  "This function use to run CLOJURE IDE on other process"
  (setenv "WORK_MODE" "CLOJURE")
  (start-process "CLOJURE IDE" "*Messages*" "emacs" "--debug-init"))

(defun run-ECLIM-IDE-other-process ()
  "This function use to run ECLIM IDE on other process"
  (setenv "WORK_MODE" "ECLIM")
  (start-process "ECLIM IDE" "*Messages*" "emacs" "--debug-init"))

(defun eclim-run ()
  "Call it to run ECLIM IDE"
  (interactive)
  (run-ECLIM-IDE-other-process))

(defun clojure-run ()
  "Call it to run CLOJURE IDE"
  (interactive)
  (run-CLOJURE-IDE-other-process))

(defun CEDET ()
  "Call it to run CEDET IDE"
  (interactive)
  (run-CEDET-other-process))

(defun kill-current()
  (interactive)
  (kill-buffer (current-buffer)))

;; duplicating lines
(defun djcb-duplicate-line (&optional commentfirst)
  "comment line at point; if COMMENTFIRST is non-nil, comment the original"
  (interactive)
  (beginning-of-line)
  (push-mark)
  (end-of-line)
  (let ((str (buffer-substring (region-beginning) (region-end))))
    (when commentfirst
      (comment-region (region-beginning) (region-end)))
    (insert ;;-string
     (concat (if (= 0 (forward-line 1)) "" "\n") str "\n"))
    (forward-line -1)))

;;comment current line
(defun toggle-comment-line ()
  (interactive)
  (save-excursion
    (funcall
     (if (progn (beginning-of-line)
                (looking-at (format "\\s-*%s" (regexp-quote comment-start))))
         (function uncomment-region)
       (function comment-region))
     (progn (beginning-of-line) (point))
     (progn (end-of-line)       (point)))))

;; Moving lines
(defun move-line-down ()
  (interactive)
  (beginning-of-line)
  (kill-line)
  (delete-char 1)
  (end-of-line)
  (newline)
  ;; or (newline-and-indent)
  (yank)
  )

(defun move-line-up ()
  (interactive)
  (beginning-of-line)
  (kill-line)
  (delete-char 1)
  (previous-line)
  (yank)
  (newline)
  ;; or (newline-and-indent)
  (previous-line)
  )

;; OTHER FUNCTION
(add-hook 'eshell-mode-hook
          '(lambda nil
             ;; (eshell/export "EPOCROOT=\\Paragon\\")
             (let ((path (getenv "PATH")))
               (setq path (concat  "/home/w34p0n/tools/c_dev_el/tools/src:" path))
               (setenv "PATH" path))
             (local-set-key "\C-u" 'eshell-kill-input)))
;; end OTHER FUNCTION

;; Buttonize file path
(defun buttonize-buffer ()
  "Turn all file paths and URLs into buttons."
  (interactive)
  (require 'ffap)
  (deactivate-mark)
  (let (token guess beg end reached bound len)
    (save-excursion
      (setq reached (point-min))
      (goto-char (point-min))
      (while (re-search-forward ffap-next-regexp nil t)
        ;; There seems to be a bug in ffap, Emacs 23.3.1: `ffap-file-at-point'
        ;; enters endless loop when the string at point is "//".
        (setq token (ffap-string-at-point))
        (unless (string= "//" (substring token 0 2))
          ;; Note that `ffap-next-regexp' only finds some "indicator string" for a
          ;; file or URL. `ffap-string-at-point' blows this up into a token.
          (save-excursion
            (beginning-of-line)
            (when (search-forward token (point-at-eol) t)
              (setq beg (match-beginning 0)
                    end (match-end 0)
                    reached end))
            )
          (message "Found token %s at (%d-%d)" token beg (- end 1))
          ;; Now let `ffap-guesser' identify the actual file path or URL at
          ;; point.
          (when (setq guess (ffap-guesser))
            (message "  Guessing %s" guess)
            (save-excursion
              (beginning-of-line)
              (when (search-forward guess (point-at-eol) t)
                (setq len (length guess) end (point) beg (- end len))
                ;; Finally we found something worth buttonizing. It shall have
                ;; at least 2 chars, however.
                (message "    Matched at (%d-%d]" beg (- end 1))
                (unless (or (< (length guess) 2))
                  (message "      Buttonize!")
                  (make-button beg end :type 'find-file-button))
                )
              )
            )
          ;; Continue one character after the guess, or the original token.
          (goto-char (max reached end))
          (message "Continuing at %d" (point))
          )
        )
      )
    )
  )

(defun buttonize-current-buffer-on-idle (&optional secs)
  "Idle-timer (see \\[run-with-idle-timer]) that buttonizes filenames and URLs.
SECS defaults to 60 seconds idle time."
  (interactive)
  (run-with-idle-timer (or secs 60) t 'buttonize-buffer))

;; (add-hook 'after-init-hook 'buttonize-current-buffer-on-idle)
;; end Buttonize
;;; customnize function
(defun restart-emacs ()
  (interactive)
  (load-file (concat baoduy-emacs-src "init.el"))
  )

(defun open-index-org ()
  "open index.org file"
  (interactive)
  (find-file-read-only (expand-file-name "~/Dropbox/org/index.org")))

(defun dbd-or2blog-open ()
  "open index.org file"
  (interactive)
  (find-file-read-only (expand-file-name "~/Dropbox/org/blogs/index.org")))
(defun root-portal ()
       (interactive)
       ;; frame settings
       (menu-bar-mode -1)
       (tool-bar-mode -1)
       (xterm-mouse-mode 1)
       ;; prepare
       (delete-other-windows)
       ;; need to start this first for calendar buffer to end up lowest
       (calendar)
       (split-window-horizontally)
       ;; build window configuration
       (other-window 2)
       (split-window)
       (set-window-text-height nil 25)
       (split-window-horizontally)
       (other-window 1)
       ;; terminal window width
       (enlarge-window-horizontally
        (- 80 (window-width)))
       (other-window 4)
       ;; now start programms
       (other-window 1)
       (ansi-term "/bin/bash" "top")
       ;(term-exec (current-buffer) "top" "top" nil nil)
       (insert "top")
       (term-send-input)
       (other-window 1)
       (emacs-wiki-find-file "WelcomePage")
       (other-window 1)
       (eshell)
       (other-window 2)
       (calculator)
       ;; turn off undo for terminal, to avoid memory exhaust
       (with-current-buffer "*top*" (setq buffer-undo-list t))
       ;; hook settings...
       (add-hook 'kill-emacs-hook
             (lambda ()
               (save-buffer (get-buffer "freenotes"))
               (save-buffer (get-buffer "WelcomePage"))
               (emacs-wiki-publish)
               (eshell-save-some-history)
               (set-buffer (get-buffer "*top*"))
               (term-quit-subjob))))
(provide 'baoduy/misc-func)
;;; misc-func.el ends here
