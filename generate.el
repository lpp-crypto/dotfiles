; adapted from the org documentation https://orgmode.org/manual/Batch-Execution.html
; is intended to be called within the generated.sh script


(progn
  (require 'ob-tangle)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t) (shell . t))) ; <- add any other language here
  (setq org-confirm-babel-evaluate nil python-indent-guess-indent-offset-verbose nil)
  (dolist (file command-line-args-left)
    (with-current-buffer (find-file-noselect file)
      (org-babel-tangle))))
