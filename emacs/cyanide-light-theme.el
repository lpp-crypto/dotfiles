(defface cyanide-num-face
  '((t . (:weight bold :background "#87cefa" :foreground "#000000")))
  "A font for heading markers")

(defface cyanide-class-name-face
    '((t . (:background "lemon chiffon" :foreground "dark orange" :weight bold :height 1.3)))
    "A font for class names.")

(deftheme cyanide-light
  "cyanide light theme")

(custom-theme-set-faces ; this parenthesis is closed in the post-amble
 'cyanide-light

'(default ((t (:foreground "#393939" :background "#eeeee8"))))
'(border ((t (:foreground "black"))))
'(bold ((t (:weight bold))))
'(italic ((t (:italic t))))
'(fg:black ((t (:foreground "black"))))
'(bold-italic ((t (:italic t :weight bold))))
'(underline ((t (:underline t))))

'(hl-line ((t (:background "white"))))
'(mouse ((t (:foreground "black"))))
'(cursor ((t (:background "red3"))))
'(region ((t (:background "AntiqueWhite2"))))
'(highlight ((t (:background "LightSteelBlue1"))))

'(list-matching-lines-face ((t (:weight bold))))
'(view-highlight-face ((t (:background "#eeeee8"))))
'(gui-button-face ((t (:foreground "light grey"))))
'(secondary-selection ((t (:background "paleturquoise"))))
'(custom-button-face ((t (:background "cyanide" :foreground "dark cyan"))))
'(custom-documentation-face ((t (:background "cyanide"))))

'(mode-line ((t (:background "burlywood3" :foreground "wheat1"))))
'(mode-line-buffer-id ((t (:background "dark slate gray" :foreground "wheat1"))))
'(mode-line-mousable ((t (:background "dark slate gray" :foreground "wheat1"))))
'(mode-line-mousable-minor-mode ((t (:background "dark slate gray" :foreground "wheat1"))))

'(font-lock-comment-face ((t (:background "LavenderBlush1" :foreground "dim gray" :weight semi-light))))
 '(font-lock-constant-face ((t (:background "#eeeee8" :foreground "DarkOrange3"))))
 '(font-lock-builtin-face ((t (:background "#eeeee8" :foreground "OliveDrab4" :weight semi-bold))))
 '(font-lock-keyword-face ((t (:background "#eeeee8" :foreground "blue" :weight semi-bold))))
 '(font-lock-string-face ((t (:background "#f3fff0" :foreground "slate gray"))))
 '(font-lock-variable-name-face ((t (:background "#eeeee8" :foreground "brown"))))
 '(font-lock-function-name-face ((t (:background "lemon chiffon" :foreground "saddle brown" :weight semi-bold :height 1.2))))
 '(font-lock-type-face ((t (:background "#eeeee8" :foreground "Purple3"))))
 '(font-lock-warning-face ((t (:weight bold :background "lemon chiffon" :foreground "red"))))

'(cyanide-class-name-face ((t (:background "lemon chiffon" :foreground "dark orange" :weight bold :height 1.3))))

'(outline-1 ((t (:background "#eeeee8" :foreground "#96441f" :height 1.5 :weight extra-bold :box (:line-width (12 . 12) :color "#eeeee8")))))
'(outline-2 ((t (:background "#eeeee8" :foreground "#79432c" :height 1.3 :weight semi-bold :box (:line-width (9 . 9) :color "#eeeee8")))))
'(outline-3 ((t (:background "#eeeee8" :foreground "#653c29" :height 1.1 :weight semi-bold :box (:line-width (6 . 6) :color "#eeeee8")))))
'(outline-4 ((t (:background "#eeeee8" :foreground "#513428" :height 1.05 :weight semi-bold :box (:line-width (3 . 3) :color "#eeeee8")))))
'(outline-5 ((t (:background "#eeeee8" :foreground "#513428" :height 1.0 :weight semi-bold :box (:line-width (2 . 2) :color "#eeeee8")))))

'(markdown-header-face-1 ((t (:inherit 'org-document-title))))
'(markdown-header-face-2 ((t (:inherit 'outline-1))))
'(markdown-header-face-3 ((t (:inherit 'outline-2))))
'(markdown-header-face-4 ((t (:inherit 'outline-3))))
'(markdown-inline-code-face ((t (:inherit 'org-verbatim))))
'(markdown-code-face ((t (:inherit 'org-verbatim))))
'(markdown-header-delimiter-face ((t (:inherit 'cyanide-num-face))))

'(org-document-title ((t (:background "#000000" :foreground "#87cefa" :height 1.8 :weight semi-bold))))
'(org-document-info-keyword  ((t (:background "#87cefa" :foreground "#000000" :height 0.8 :weight semi-light))))

'(org-block-begin-line  ((t (:background "moccasin" :foreground "Brown4" :underline (:color "#eeeee8")))))
'(org-block ((t (:background "old lace"))))
'(org-block-end-line  ((t (:background "moccasin" :foreground "Brown4"))))

'(org-verbatim ((t (:background "old lace" :foreground "chartreuse4" :weight semi-light))))
'(org-link ((t (:foreground "midnight blue" :background "alice blue" :underline (:color "gray" :style dashes)))))
'(org-tag  ((t (:background "#eeeee8" :foreground "steel blue" :weight semi-light :height 0.8))))
'(org-drawer  ((t (:background "#eeeee8" :foreground "#727272" :weight semi-light :height 0.7))))
'(org-table  ((t (:background "#eeeee8" :foreground "Purple3" :weight semi-light :height 0.9))))

'(org-headline-done ((t (:foreground "dark green" :background "#eeeee8"))))
'(org-headline-todo ((t (:foreground "brown"))))

'(font-latex-sectioning-1-face ((t (:inherit 'org-document-title))))
'(font-latex-sectioning-2-face ((t (:inherit 'outline-1))))
'(font-latex-sectioning-3-face ((t (:inherit 'outline-2))))
'(font-latex-sectioning-4-face ((t (:inherit 'outline-3))))
'(font-latex-sectioning-5-face ((t (:inherit 'outline-4))))

'(font-latex-math-face ((t :inherit 'org-verbatim)))

'(calendar-today-face ((t (:underline t))))
'(diary-face ((t (:foreground "red"))))
'(gnus-mouse-face ((t (:background "LightSteelBlue1"))))
'(gnus-group-mail-1-empty-face ((t (:foreground "DeepPink3"))))
'(gnus-group-mail-1-face ((t (:weight bold :foreground "DeepPink3"))))
'(gnus-group-mail-2-empty-face ((t (:foreground "HotPink3"))))
'(gnus-group-mail-2-face ((t (:weight bold :foreground "HotPink3"))))
'(gnus-group-mail-3-empty-face ((t (:foreground "magenta4"))))
'(gnus-group-mail-3-face ((t (:weight bold :foreground "magenta4"))))
'(gnus-group-mail-low-empty-face ((t (:foreground "DeepPink4"))))
'(gnus-group-mail-low-face ((t (:weight bold :foreground "DeepPink4"))))
'(gnus-group-news-1-empty-face ((t (:foreground "ForestGreen"))))
'(gnus-group-news-1-face ((t (:weight bold :foreground "ForestGreen"))))
'(gnus-group-news-2-empty-face ((t (:foreground "CadetBlue4"))))
'(gnus-group-news-2-face ((t (:weight bold :foreground "CadetBlue4"))))
'(gnus-group-news-3-empty-face ((t (nil))))
'(gnus-group-news-3-face ((t (:weight bold))))
'(gnus-group-news-low-empty-face ((t (:foreground "DarkGreen"))))
'(gnus-group-news-low-face ((t (:weight bold :foreground "DarkGreen"))))
'(gnus-splash-face ((t (:foreground "ForestGreen"))))
'(gnus-summary-cancelled-face ((t (:background "black" :foreground "yellow"))))
'(gnus-summary-high-ancient-face ((t (:weight bold :foreground "RoyalBlue"))))
'(gnus-summary-high-read-face ((t (:weight bold :foreground "DarkGreen"))))
'(gnus-summary-high-ticked-face ((t (:weight bold :foreground "firebrick"))))
'(gnus-summary-high-unread-face ((t (:weight bold))))
'(gnus-summary-low-ancient-face ((t (:italic t :foreground "RoyalBlue"))))
'(gnus-summary-low-read-face ((t (:italic t :foreground "DarkGreen"))))
'(gnus-summary-low-ticked-face ((t (:italic t :foreground "firebrick"))))
'(gnus-summary-low-unread-face ((t (:italic t))))
'(gnus-summary-normal-ancient-face ((t (:foreground "RoyalBlue"))))
'(gnus-summary-normal-read-face ((t (:foreground "DarkGreen"))))
'(gnus-summary-normal-ticked-face ((t (:foreground "firebrick"))))
'(gnus-summary-normal-unread-face ((t (nil))))
'(gnus-summary-selected-face ((t (:underline t))))
'(holiday-face ((t (:background "pink"))))
'(ibuffer-marked-face ((t (:foreground "red"))))
'(message-cited-text-face ((t (:foreground "red"))))
'(message-header-cc-face ((t (:foreground "MidnightBlue"))))
'(message-header-name-face ((t (:foreground "cornflower blue"))))
'(message-header-newsgroups-face ((t (:italic t :weight bold :foreground "blue4"))))
'(message-header-other-face ((t (:foreground "steel blue"))))
'(message-header-subject-face ((t (:weight bold :foreground "navy blue"))))
'(message-header-to-face ((t (:weight bold :foreground "MidnightBlue"))))
'(message-header-xheader-face ((t (:foreground "blue"))))
'(message-separator-face ((t (:foreground "brown"))))
'(sgml-comment-face ((t (:foreground "dark green"))))
'(sgml-doctype-face ((t (:foreground "maroon"))))
'(sgml-end-tag-face ((t (:foreground "blue2"))))
'(sgml-entity-face ((t (:foreground "red2"))))
'(sgml-ignored-face ((t (:background "gray90" :foreground "maroon"))))
'(sgml-ms-end-face ((t (:foreground "maroon"))))
'(sgml-ms-start-face ((t (:foreground "maroon"))))
'(sgml-pi-face ((t (:foreground "maroon"))))
'(sgml-sgml-face ((t (:foreground "maroon"))))
'(sgml-short-ref-face ((t (:foreground "goldenrod"))))
'(sgml-start-tag-face ((t (:foreground "blue2"))))
'(show-paren-match-face ((t (:background "SlateGray1"))))
'(show-paren-mismatch-face ((t (:background "purple" :foreground "white"))))
'(speedbar-button-face ((t (:foreground "green4"))))
'(speedbar-directory-face ((t (:foreground "blue4"))))
'(speedbar-file-face ((t (:foreground "cyan4"))))
'(speedbar-highlight-face ((t (:background "dark turquoise" :foreground "white"))))
'(speedbar-selected-face ((t (:underline t :foreground "red"))))
'(speedbar-tag-face ((t (:foreground "brown"))))

) ; closing the parenthesis opened in the preamble

(setopt org-num-face 'cyanide-num-face)

(font-lock-add-keywords
 'python-mode
 '(; python
   ("^[[:blank:]]*class[[:blank:]]+\\(.*\\):" 1 'cyanide-class-name-face t) 
   ; cython
   ("cdef[[:blank:]]+class[[:blank:]]+\\(.*\\):" 1 'cyanide-class-name-face t)
   ("^[[:blank:]]*cppclass[[:blank:]]+\\(.*\\):" 1 'cyanide-class-name-face t) 
   ("\\(cdef\\)[[:blank:]]+" 1 '(:inherit 'font-lock-keyword-face :background "thistle") t)
   ("\\(cppclass\\)[[:blank:]]+" 1 '(:inherit 'font-lock-keyword-face :background  "thistle") t)
   ("\\(extern\\)[[:blank:]]+" 1 '(:inherit 'font-lock-keyword-face :background "thistle") t)
   ("^[[:blank:]]*cdef[[:blank:]]+\\(.*\\)(.*):" 1 'font-lock-function-name-face t)))

(font-lock-add-keywords
 'LaTeX-mode
 '(
   ("\\(\\\\.*section\\*?\\){" 1 'cyanide-num-face t)
   ("\\(\\\\paragraph\\*?\\){" 1 'cyanide-num-face t))
 'latex-mode
 '(
   ("\\(\\\\.*section\\*?\\){" 1 'cyanide-num-face t)
   ("\\(\\\\paragraph\\*?\\){" 1 'cyanide-num-face t)))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))



(provide-theme 'cyanide-light)
