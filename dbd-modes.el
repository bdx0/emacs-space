;;; dbb-modes.el --- define function for dbd-modes.

;;; Commentary:
;;

(eval-when-compile (require 'cl))

(defun dbd-org2blog-mode ()
  "This function use to run org2blog in the new process with org2blog."
  (setenv "WORK_MODE" "ORG2BLOG")
  (start-process "ORG2BLOG" "*ORG2BLOG*" "emacs" (expand-file-name "blogs/index.org" dbd-org-data-dir)))

(add-hook 'kill-emacs-hook '(lambda () (setq dbd-emacs-instance -1)))
(setq dbd-emacs-instance 1)

(defun dbd-default-mode()
  "only load new frame"
  (new-frame))

(defun dbd-ec-new()
  "Create new instance of default mode."
  (setenv "WORK_MODE" (concat "Instance-" (number-to-string dbd-emacs-instance)))
  (start-process "NEW" "*NEW*" "emacs"))

(defun dbd-c-cpp-mode ()
  "This function use to run C/C++ IDE on other process"
  (setenv "WORK_MODE" "C/C++ IDE")
  (start-process "C/CPP-IDE" "*C/CPP-IDE*" "emacs"))

(defun dbd-java-mode ()
  "This function call JAVA IDE process"
  (setenv "WORK_MODE" "JAVA")
  (start-process "JAVA IDE" "*JAVA IDE*" "emacs" "--debug-init")
  )

(defun dbd-eclim-mode ()
  "This function use to run ECLIM IDE on other process"
  (setenv "WORK_MODE" "ECLIM")
  (start-process "ECLIM IDE" "*ECLIM IDE*" "emacs" "--debug-init"))

(defun dbd-clojure-mode ()
  "This function use to run CLOJURE IDE on other process"
  (setenv "WORK_MODE" "CLOJURE")
  (start-process "CLOJURE IDE" "*CLOJURE IDE*" "emacs" "--debug-init"))


;; will change locate to other place. all modified auto-mode-alist at here.
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(provide 'dbd-modes)

;;; dbb-modes.el ends here
