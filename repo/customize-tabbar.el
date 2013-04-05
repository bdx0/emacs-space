;;------------------------------------------------------------------------------
;;wcy-swbuff
;;------------------------------------------------------------------------------
(require 'wcy-swbuff)
;;then you can use <C-tab> and <C-S-kp-tab> to switch buffer.
(global-set-key (kbd "<C-c tab>") 'wcy-switch-buffer-forward) ;;设置C-TAB为切换BUFFER
(global-set-key (kbd "<C-S-iso-lefttab>") 'wcy-switch-buffer-backward)
(global-set-key (kbd "<C-c backtab>") 'wcy-switch-buffer-backward)
(setq wcy-switch-buffer-active-buffer-face  'highlight)
(setq wcy-switch-buffer-inactive-buffer-face  'secondary-selection)


;; ============================================================================
;; Tabbar
;; ============================================================================
;; the color of the tabbar background #959A79 #f2f2f6
;; (load-file (concat (get-custom-path) "tabbar/tabbar.el"))
(require 'tabbar)
;; Tabbar settings
(set-face-attribute
 'tabbar-default nil
 :background "gray20"
 :foreground "gray20"
 :box '(:line-width 1 :color "gray20" :style nil))
(set-face-attribute
 'tabbar-unselected nil
 :background "gray30"
 :foreground "white"
 :box '(:line-width 5 :color "gray30" :style nil))
(set-face-attribute
 'tabbar-selected nil
 :background "gray75"
 :foreground "black"
 :box '(:line-width 5 :color "gray75" :style nil))
(set-face-attribute
 'tabbar-highlight nil
 :background "white"
 :foreground "black"
 :underline nil
 :box '(:line-width 5 :color "white" :style nil))
(set-face-attribute
 'tabbar-button nil
 :box '(:line-width 1 :color "gray20" :style nil))
(set-face-attribute
 'tabbar-separator nil
 :background "gray20"
 :height 0.6)

;; Change padding of the tabs
;; we also need to set separator to avoid overlapping tabs by highlighted tabs
;; so we add spaces
(defun tabbar-buffer-tab-label (tab)
  "Return a label for TAB.
That is, a string used to represent it on the tab bar."
  (let ((label  (if tabbar--buffer-show-groups
                    (format "[%s]  " (tabbar-tab-tabset tab))
                  (format "%s  " (tabbar-tab-value tab)))))
    ;; Unless the tab bar auto scrolls to keep the selected tab
    ;; visible, shorten the tab label to keep as many tabs as possible
    ;; in the visible area of the tab bar.
    (if tabbar-auto-scroll-flag
        label
      (tabbar-shorten
       label (max 1 (/ (window-width)
                       (length (tabbar-view
                                (tabbar-current-tabset)))))))))

;; key bindings:
;; I use C-S-< and C-S-> to jump among tabs in the same group, and use C-S-n and C-S-p to switch among groups. Here is the
;; code in .emacs file:
(global-set-key (kbd "<C-next>") 'tabbar-forward-tab)
(global-set-key (kbd "<C-prior>") 'tabbar-backward-tab)
(global-set-key (kbd "<C-home>") 'tabbar-forward-group)
(global-set-key (kbd "<C-end>") 'tabbar-backward-group)

(global-set-key (kbd "C-c <next>") 'tabbar-forward-tab)
(global-set-key (kbd "C-c <prior>") 'tabbar-backward-tab)
(global-set-key (kbd "C-c <home>") 'tabbar-forward-group)
(global-set-key (kbd "C-c <end>") 'tabbar-backward-group)

;; ============ labs =====================
;; advanture setting for tab group

;; adding spaces
(defun duyduong/tabbar-buffer-groups-by-dir ()
  "Put all files in the same directory into the same tab bar"
  (with-current-buffer (current-buffer)
	(let ((dir (expand-file-name default-directory)))
	  (cond ;; assign group name until one clause succeeds, so the order is important
	   ((eq major-mode 'dired-mode)
		(list "Dired"))
	   ((memq major-mode
			  '(help-mode apropos-mode Info-mode Man-mode))
		(list "Help"))
	   ((string-match-p "\*.*\*" (buffer-name))
		(list "Misc"))
	   (t (list dir))))))
(defun duyduong/tabbar-buffer-groups (buffer)
  "Return the list of group names BUFFER belongs to. Return only one group for each buffer."
  (with-current-buffer (get-buffer buffer)
	(cond
	 ((string-equal "*" (substring (buffer-name) 0 1))
	  '("Emacs Buffer"))
	 ((eq major-mode 'dired-mode)
	  '("Dired"))
	 (t
	  '("User Buffer"))
	 )))
(defun duyduong/tabbar-buffer-ignore-groups (buffer)
    "Return the list of group names BUFFER belongs to.Return only one group for each buffer."
    (with-current-buffer (get-buffer buffer)
        (cond
            ((or (get-buffer-process (current-buffer)) 
            (memq major-mode 
                '(comint-mode compilation-mode))) 
                '("Process"))
            
            ((member (buffer-name) '("*scratch*" "*Messages*")) '("Common") )
            
            ((eq major-mode 
                'dired-mode) 
                '("Dired"))
        
            ((memq major-mode
                '(help-mode apropos-mode Info-mode Man-mode))
                '("Help")
            )
            
            ((memq major-mode
                '(rmail-mode
                rmail-edit-mode vm-summary-mode vm-mode mail-mode
                mh-letter-mode mh-show-mode mh-folder-mode
                gnus-summary-mode message-mode gnus-group-mode
                gnus-article-mode score-mode gnus-browse-killed-mode))
                '("Mail")
            )
            
            (t
                (list 
                    "default" ;; no-grouping
                    (if (and (stringp mode-name) (string-match "[^ ]" mode-name));;if part
                            mode-name   ;;then part
                        (symbol-name major-mode);;else part
                    ) 
                )
            );;end:t
        );;end:cond
    )
)
(defun duyduong/tabbar-buffer-list-all ()
  (list "All")
  )


(defun tabbar-switch-grouping-method (&optional arg)
  "Changes grouping method of tabbar to grouping by dir.
With a prefix arg, changes to grouping by major mode."
  (interactive "P")
  (ignore-errors
    (if arg
		(setq tabbar-buffer-groups-function 'tabbar-buffer-groups) ;; the default setting
	  (setq tabbar-buffer-groups-function 'tabbar-buffer-groups-by-dir))))

(setq tabbar-cycle-scope (quote tabs))
(setq table-time-before-update 0.1)
(setq tabbar-use-images t)

(tabbar-mode t)

;; ============================================================================
;; Toolbars
;; ============================================================================

;; list of opened files/buffers
(require 'sr-speedbar)

;; Minimap
(require 'minimap)
(provide 'customize-tabbar)
