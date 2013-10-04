(require 'dired+)
(require 'paren)
(require 'nav)
(require 'ido)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

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

(defun clojure-run ()
  "Call it to run CLOJURE IDE"
  (interactive)
  (run-CLOJURE-IDE-other-process))

(defun CEDET ()
  "Call it to run CEDET IDE"
  (interactive)
  (run-CEDET-other-process))

;; config for dired+
(setq show-paren-style 'expression)
(show-paren-mode t)

(defun kill-current() 
  (interactive)
  (kill-buffer (current-buffer)))

(global-set-key  [f1] (lambda () (interactive) (manual-entry (current-word))))
(global-set-key  [f2] (lambda ()  (interactive)(shell)))
;; (global-unset-key (kbd "<C-z>"))
;; (global-unset-key (kbd "<C-S-z>"))
(global-set-key "\C-z" 'undo)
(global-set-key (kbd "<M-escape>") 'kill-current)
(global-set-key [S-mouse-2] 'browse-url-at-mouse)
(global-set-key [C-tab] 'other-window)

(nav-disable-overeager-window-splitting)
;; Optional: set up a quick key to toggle nav
(global-set-key [f8] 'nav-toggle)

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
;; duplicate a line
(global-set-key (kbd "C-c d") 'djcb-duplicate-line)
;; duplicate a line and comment the first
(global-set-key (kbd "C-c C-d") (lambda()(interactive)(djcb-duplicate-line t)))

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
;; set keybinding
(global-set-key (kbd "C-c C-c") 'toggle-comment-line)

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
(global-set-key (kbd "M-n") 'move-line-down)
(global-set-key (kbd "<M-down>") 'move-line-down)
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
(global-set-key (kbd "<M-up>") 'move-line-up)
(global-set-key (kbd "M-p") 'move-line-up)

;; OTHER FUNCTION
(require 'openwith)
(openwith-mode t)
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
;;; END customize func

(provide 'baoduy/cusFunc)
