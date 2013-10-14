;; This buffer is for notes you don't want to save, and for Lisp evaluation.
;; If you want to create a file, visit that file with C-x C-f,
;; then enter the text in that file's own buffer.

(while ())
(load-file (expand-file-name "~/.emacs.d/init.el"))
(setq dirs (directory-files (expand-file-name
			     dbd-org-data-dir)))
(cdr dirs)
(setq dirs '("hello" "123213" "3123" ".." "..." "."))
(remove ".." dirs)
(dbd-delete ".." dirs 'equal)74
(funcall 'string= "." (car dirs))
(apply '+ '(4 5))
(equal ".." "..")
(dbd-delete ".." dirs)
(elt test 2)
(setq exclue 'daisy)
(setq ptr test)
(setq ptr1 (car test))
(setq test )
q
(cons  'test (cdr  test))
(setcar (cdr test) 'nil)
(setcar test nil)
(cons 'z (cdr test))
(print test)


