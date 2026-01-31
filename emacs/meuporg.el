;;; meuporg.el --- Provides shortcuts for easier use of meup!org.

;; Copyright (C) 2012 Leo Perrin
;;
;; Author: Leo "picarresursix" Perrin <leoperrin@picarresursix.fr>
;; Created: 2012-12-20
;; Version: 1.0
;; Keywords: project management, data centralisation
;; URL: https://github.com/picarresursix/meuporg
;; Compatibility:  GNU Emacs 28.x
;;
;; This file is NOT part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 2
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;

;;; Commentary:
;;
;; Move this file somewhere in your emacs load-path. Then, add the following
;; to your .emacs file:
;; 
;; (load-file meuporg.el)
;; 
;;; Issues:
;;
;;; TODO:
;; 
;;; Change Log:
;;
;;; SECTION:


(defvar meuporg/font-faces
  "Defines how the different items should be displayed in the
  list of items.")
(setq meuporg/font-faces
      '(
        ; action items
        ("CONTINUE" . (:weight bold :foreground "#880066"))
        ("TODO" . '(:foreground "#C00000"))
        ("FIXME" . '(:foreground "#E08040"))
        ("IMPROVE" . '(:foreground "#119922"))
        ("CHECK" . '(:foreground "#004488"))
        ; mode specific items
        ("FIXREF" . '(:foreground "#AA9900"))))

(defun meuporg/open-main()
  "Open the meuporg of which the current file depends (if any)."
 )


; !SUBSECTION! Inserting items


(defun meuporg/insert-item(name)
  "Inserts an item with the given name in a new comment on a new
  indented line"
  (newline-and-indent)
  (insert (concat comment-start "!" name "!  " comment-end))
  (backward-char (+ 1 (length comment-end))))

(defun meuporg/insert-todo()
  "Inserts a TODO meuporg item."
  (interactive)
  (meuporg/insert-item "TODO"))

(defun meuporg/insert-continue()
  "Inserts a TOCHECK meuporg item."
  (interactive)
  (meuporg/insert-item "CONTINUE"))

(defun meuporg/insert-improve()
  "Inserts an IMPROVE meuporg item."
  (interactive)
  (meuporg/insert-item "IMPROVE"))

(defun meuporg/insert-check()
  "Inserts a CHECK meuporg item."
  (interactive)
  (meuporg/insert-item "CHECK"))

(defun meuporg/insert-fixme()
  "Inserts a FIXME meuporg item."
  (interactive)
  (meuporg/insert-item "FIXME"))

(defun meuporg/insert-section()
  "Inserts a SECTION meuporg item."
  (interactive)
  (meuporg/insert-item "SECTION"))

(defun meuporg/insert-subsection()
  "Inserts a SUBSECTION meuporg item."
  (interactive)
  (meuporg/insert-item "SUBSECTION"))

(defun meuporg/insert-subsubsection()
  "Inserts a SUBSUBSECTION meuporg item."
  (interactive)
  (meuporg/insert-item "SUBSUBSECTION"))

(defun meuporg/insert-fixref()
  "Inserts a FIXREF meuporg item.

Since this item is supposed to be inserted within a paragraph, no
new comment is created."
  (interactive)
  (insert "!FIXREF! "))


; !SUBSECTION! Navigating to items


(defun meuporg/go-to-next-item()
  "Moves cursor to the next item."
  (interactive)
  (condition-case ex
      (search-forward-regexp "\![a-zA-Z0-9_]*\!")
    ('error
     (message "No items after cursor."))))

(defun meuporg/go-to-previous-item()
  "Moves cursor to the previous item."
  (interactive)
  (condition-case ex
      (search-backward-regexp "\![a-zA-Z0-9_]*\!")
    ('error
     (message "No items before cursor."))))

(defun meuporg/go-to-next-section()
  "Moves cursor to the next highest level section."
  (interactive)
  (condition-case ex
      (search-forward-regexp "\\(!SECTION!\\)\\|\\(^\\\\section{.*}\\)")
    ('error
     (message "No section after cursor."))))

(defun meuporg/go-to-previous-section()
  "Moves cursor to the next highest level section."
  (interactive)
  (condition-case ex
      (search-backward-regexp "\\(!SECTION!\\)\\|\\(^\\\\section{.*}\\)")
    ('error
     (message "No section before cursor."))))




; !SUBSECTION! Minor mode declaration


(defface meuporg-content
  '((t . (:weight semi-light :background "old lace" :foreground "black")))
  "A font for meuporg comments")

(defface meuporg-label
  '((t . (:weight bold :background "old lace" :foreground "brown")))
  "A font for meuporg labels")


(defun meuporg-outline-level ()
  (- (match-end 0) (match-beginning 0)))


(defun pi2-6-outline-minor-mode()
  (interactive)
  (when (not (string= major-mode "org-mode"))
    (progn
      (if (not (string= major-mode "LaTeX-mode"))
          (setq-local outline-regexp ".*!\\(SUB\\)*SECTION!" )
        (setq-local outline-regexp "\\\\\\(sub\\)*section{" outline-heading-end-regexp "}")
        )
      (setq-local outline-heading-end-regexp "\n" outline-level #'meuporg-outline-level )
      (outline-minor-mode))))



(define-minor-mode meuporg-minor-mode
    "Toggle meuporg mode.

  Interactively with no argument, this command toggles the mode.
  A positive prefix argument enables the mode, any other prefix
  argument disables it.  From Lisp, argument omitted or nil enables
  the mode, `toggle' toggles the state. "
   ;; The initial value.
   :init-value nil
   ;; The indicator for the mode line.
   :lighter " !M!"
   :keymap
   `(
     (,(kbd "C-! i s 1") . meuporg/insert-section)
     (,(kbd "C-! i s 2") . meuporg/insert-subsection)
     (,(kbd "C-! i s 3") . meuporg/insert-subsubsection)
     (,(kbd "C-! i i") . meuporg/insert-improve)
     (,(kbd "C-! i t") . meuporg/insert-todo)
     (,(kbd "C-! i c") . meuporg/insert-continue)
     (,(kbd "C-! i k") . meuporg/insert-check)
     (,(kbd "C-! i f") . meuporg/insert-fixme)
     (,(kbd "C-! i r") . meuporg/insert-fixref)
     (,(kbd "M-c") . outline-cycle)
     (,(kbd "M-C") . outline-cycle-buffer))

   ;; body of the initialization
   (when meuporg-minor-mode
     (font-lock-add-keywords
      nil
      '(
        ("^\\W*\\(!.*\\)" 1 'meuporg-content t)
        ("!\\(\\w+\\)!" 1 'meuporg-label t)
        ("!SECTION!\\(.*\\)" 1 'outline-1 t)
        ("!SUBSECTION!\\(.*\\)" 1 'outline-2 t)
        ("!SUBSUBSECTION!\\(.*\\)" 1 'outline-3 t)
        ("!\\(TODO\\)!" 1 '(:background "white" :foreground "red3" :weight bold) prepend)
        ("!\\(CONTINUE\\)!" 1 '(:background "white" :foreground "dark violet" :weight bold) prepend)
        ("!\\(.*SECTION\\)!" 1 'structure-highlight t)))
     (font-lock-add-keywords
      'LaTeX-mode
      '(
        ("\\\\title{\\(.*\\)}" 1 'org-document-title prepend)
        ("\\\\\\(title\\){" 1 'structure-highlight prepend)
        ("\\\\\\(.*section\\){" 1 'structure-highlight prepend)
        ("\\\\\\(paragraph\\){" 1 'structure-highlight prepend)
        ))
     (if (not (string= major-mode "LaTeX-mode"))
         (setq-local outline-regexp ".*!\\(SUB\\)*SECTION!" )
       (setq-local outline-regexp "\\\\\\(sub\\)*section{" outline-heading-end-regexp "}"))
     (setq-local outline-heading-end-regexp "\n" outline-level #'meuporg-outline-level)))


(setopt org-num-face 'structure-highlight)
(add-hook 'after-change-major-mode-hook
          (lambda ()
            (when (not (string= major-mode "org-mode"))
              (meuporg-minor-mode))))


