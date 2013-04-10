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
  (start-process "CEDET" nil "emacs" "--debug-init")
  )

(defun run-C-C++-IDE-other-process ()
  "This function use to run C/C++ IDE on other process"
  (setenv "WORK_MODE" "C/C++ IDE")
  ;; (call-process "emacs" nil nil nil "&")
  (start-process "C/C++ IDE" nil "emacs")
  )

(defun run-JAVA-IDE-other-process ()
  "This function use to run JAVA IDE on other process"
  (setenv "WORK_MODE" "JAVA")
  (start-process "JAVA IDE" nil "emacs")
  )

(defun CEDET ()
  "Call it to run CEDET IDE"
  (interactive)
  (run-CEDET-other-process)
  )

  ;; config for dired+
(setq show-paren-style 'expression)
(show-paren-mode t)

(defun kill-current() 
  (interactive)
  (kill-buffer (current-buffer)))

(global-set-key  [f1] (lambda () (interactive) (manual-entry (current-word))))
(global-set-key  [f2] (lambda ()  (interactive)(shell)))
(global-set-key (kbd "<C-escape>") 'kill-current)
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
;; end OTHER FUNCTION


(provide 'baoduy/cusFunc)
