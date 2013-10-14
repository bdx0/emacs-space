;;; dbb-modes.el --- define function for dbd-modes.

;;; Commentary:
;;

(eval-when-compile (require 'cl))

(defun dbd-org2blog-mode ()
  "This function use to run org2blog in the new process with org2blog."
  (start-process "ORG2BLOG" "*ORG2BLOG*" "emacs" (expand-file-name "blogs/index.org" dbd-org-data-dir)))

(defun dbd-default-mode()
  "")

(defun dbd-ec-new()
  ""
  (start-process "NEW" "*NEW*" "emacs"))

(defun dbd-c-cpp-mode ()
  "This function use to run C/C++ IDE on other process"
  (setenv "WORK_MODE" "C/C++ IDE")
  (start-process "C/CPP-IDE" "*C/CPP-IDE*" "emacs"))

;; will change locate to other place. all modified auto-mode-alist at here.
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(provide 'dbd-modes)

;;; dbb-modes.el ends here
