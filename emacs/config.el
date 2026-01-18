(setq initial-buffer-choice "~/org/todo.org")
(setq inhibit-startup-screen t)

(menu-bar-mode -1) 
(tool-bar-mode -1)
(setq package-check-signature nil)
(setq enable-local-variables :all)
(require 'cl-lib)
(cua-mode)

(defun pi2/6-reinitialize-emacs()
  (interactive)
  (load-file "~/new-emacs/config.el")
  (revert-buffer)
)

(add-to-list 'default-frame-alist '(font . "Fira Code" ))
(set-face-attribute 'default t :font "Fira Code")

(defun basic-theme()
  (interactive)
  (load-file "~/new-emacs/discret-light-theme.el")
  (load-theme 'discret-light t))

(basic-theme)

(defun capture-theme()
  (load-theme 'spacemacs-dark t))

(global-display-line-numbers-mode 1)

(global-visual-line-mode t)

(global-hl-line-mode)

(use-package beacon
  :ensure beacon
  :config
  ((beacon-mode 1)
   (setq beacon-blink-when-window-changes t
         beacon-blink-when-focused t
         beacon-color "#C00000"
         beacon-size 15
         beacon-blink-when-window-scrolls t)))

(setq c-default-style "bsd")
(setq-default c-basic-offset 4)
(setq-default indent-tabs-mode nil)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (C . t)))

(setq org-babel-python-command "python3")
(setq org-confirm-babel-evaluate nil)

(setq find-file-visit-truename t)

(setq org-agenda-files '("~/roam/projects/"))
(org-todo-list)
(delete-other-windows)
