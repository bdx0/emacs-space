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
;; (global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-S-z") 'indent-buffer)
(global-set-key (kbd "M-q") 'kill-current)
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

(provide 'baoduy/cusKey)
