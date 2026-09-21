(defun pi2-6-start-flyspell-mode(dict)
  (ispell-change-dictionary dict)
  (flyspell-mode 1)
  (flyspell-buffer)
  (message (format "launched flyspell; language: %s"
                   ispell-local-dictionary)))

(defun pi2-6-flyspell-mode(p)
  "Prompts the user for a letter and generates a file of the corresponding type"
  (interactive "c[e] English   [f] French")
  (cond ((eq b ?e) (pi2-6-start-flyspell-mode "english"))
        ((eq b ?f) (pi2-6-start-flyspell-mode "french"))
        (t (message "unrecognized language"))))
