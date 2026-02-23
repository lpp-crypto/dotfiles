(use-package compile-angel
    :ensure t

    :config
    ;; Set `compile-angel-verbose' to nil to disable compile-angel messages.
    ;; (When set to nil, compile-angel won't show which file is being compiled.)
    (setq compile-angel-verbose t)

    ;; Uncomment the line below to compile automatically when an Elisp file is saved
    ;; (add-hook 'emacs-lisp-mode-hook #'compile-angel-on-save-local-mode)

    ;; The following directive prevents compile-angel from compiling your init
    ;; files. If you choose to remove this push to `compile-angel-excluded-files'
    ;; and compile your pre/post-init files, ensure you understand the
    ;; implications and thoroughly test your code. For example, if you're using
    ;; the `use-package' macro, you'll need to explicitly add:
    ;; (eval-when-compile (require 'use-package))
    ;; at the top of your init file.
    (push "/init.el" compile-angel-excluded-files)

    ;; A global mode that compiles .el files before they are loaded
    ;; using `load' or `require'.
    (compile-angel-on-load-mode 1))

  ;; Ensure Emacs loads the most recent byte-compiled files.
(setopt load-prefer-newer t)

;; Make Emacs Native-compile .elc files asynchronously by setting
;; `native-comp-jit-compilation' to t.
(setopt native-comp-jit-compilation t)

(setq initial-buffer-choice "~/org/todo.org"
      inhibit-startup-screen t)

(menu-bar-mode -1) 
(tool-bar-mode -1)
(setq package-check-signature nil)
(setq enable-local-variables :all)
(require 'cl-lib)

(setq package-user-dir "~/dotfiles/emacs/elpa")

(defun pi2/6-reinitialize-emacs()
  (interactive)
  (load-file "~/.emacs.el")
  (revert-buffer)
)

(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-backup" . "http://www.mirrorservice.org/sites/stable.melpa.org/packages/") t)
(package-initialize)
(require 'use-package)

(add-to-list 'default-frame-alist '(font . "Fira Code" ))
(set-face-attribute 'default t :font "Fira Code")

(load-file "~/dotfiles/emacs/discret-light-theme.el")
(load-theme 'discret-light t)

(global-display-line-numbers-mode 1)

(global-visual-line-mode t)

(global-hl-line-mode)

(use-package beacon
  :ensure t
  :config
  (beacon-mode)
  (setq beacon-blink-when-window-changes t
        beacon-blink-when-focused t
        beacon-color "#d9a032"
        beacon-size 15
        beacon-blink-when-window-scrolls t))

(setq find-file-visit-truename t)

(setopt org-startup-indented t
              org-pretty-entities t
              org-hide-emphasis-markers t
              org-startup-with-inline-images t
              org-image-actual-width '(300)
              org-tags-column 10
              org-link-elisp-confirm-function nil
              )
(setopt
 org-file-apps
 '(
   ("\\.mm\\'" . default)
   ("\\.x?html?\\'" . default)
   ("\\.pdf::#\\([0-9]+\\)?" . "evince %s -i %1")
                                        ; ("\\.pdf::\\(\\?\\(:[[:alnum:]]\\|[[:space:]]\\|[[:punct:]]\\)+\\)?" . "evince %s -l \"%1\"")
   ("\\.pdf::\\([a-zA-Z0-9,.; ]+\\)?" . "evince %s -l \"%1\"")
   ("\\.pdf" . "evince %s")
   ("\\.mp4" . "vlc %s")
   ("\\.webm" . "vlc %s")
   (auto-mode . emacs)
   ))

;; (use-package org-superstar
;;   :ensure t
;;   )

(use-package org-fragtog
  :ensure t

  :after org

  :custom
  (org-startup-with-latex-preview t)

  :custom
  (org-format-latex-options
   (plist-put org-format-latex-options :scale 1.5)
   (plist-put org-format-latex-options :foreground 'auto)
   (plist-put org-format-latex-options :background 'auto))
  )

(use-package org
  :ensure t
  
  :mode
  (("\\.org$" . org-mode))
  
  :hook
  (org-mode . (lambda ()
                (org-fragtog-mode)
                ;(org-superstar-mode)
                (org-num-mode)))
  )

(setopt org-tag-persistent-alist
       '(("ongoingWork" . ?o)
         ("attentionNeeded" . ?n)
         ("stable" . ?s)
         ("hack" . ?h)))

(setopt org-tag-faces
        '(("ongoingWork" . (:background "yellow" :foreground "dim gray"))
          ("attentionNeeded" . (:background "orange" :foreground "dim gray"))
          ("stable" . (:foreground "chartreuse2"))
          ("hack" . (:foreground "tomato"))))

(add-hook
 'after-change-major-mode-hook
 (lambda ()
   (if (and (boundp 'local-org-tag-faces))
       (setopt org-tag-faces local-org-tag-faces))))

(defun pi2-6-attach-make-link()
  (interactive)
  (end-of-line)
  (re-search-backward "^\\(\\*+\\) \\([^:]+\\)")
  (replace-match "\\1 [[elisp:(org-attach-open)][\\2]] ")
  )

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (C . t)
   (shell . t)))

(setq org-babel-python-command "python3"
      org-confirm-babel-evaluate nil)

(setq org-agenda-files '("~/roam/projects/"))

(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory (file-truename "~/roam/"))
  (org-roam-completion-everywhere t)
  (org-roam-capture-templates
   '(("d" "default" plain
      "%?"
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)))
  ;; :bind (("M-ç l" . pi2-6-org-roam-find-paper)
  ;;        ("M-ç o" . pi2-6-org-roam-find-other)
  ;;        ("M-ç r" . pi2-6-org-roam-find-review)
  ;;        ("M-ç c" . org-roam-capture)
  ;;        ("M-ç i" . org-roam-node-insert)
  ;;        ("M-ç m" . pi2-6/open-meuporg-roam)
  ;;        )
  :config
  (org-roam-setup))

(org-roam-db-autosync-mode)

;; Optionally use the `orderless' completion style.
(use-package orderless
  :ensure t
  :custom
  ;; (orderless-style-dispatchers '(orderless-affix-dispatch))
  ;; (orderless-component-separator #'orderless-escapable-split-on-space)
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion))))
  (completion-category-defaults nil) ;; Disable defaults, use our settings
  (completion-pcm-leading-wildcard t) ;; Emacs 31: partial-completion behaves like substring
)

(use-package corfu
  :ensure t
  :custom
  (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  (corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
  (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
  (corfu-preview-current nil)    ;; Disable current candidate preview
  (corfu-preselect 'prompt)      ;; Preselect the prompt
  (corfu-on-exact-match 'insert) ;; Configure handling of exact matches

  ;; Enable Corfu only for certain modes. See also `global-corfu-modes'.
  ;; :hook ((prog-mode . corfu-mode)
  ;;        (shell-mode . corfu-mode)
  ;;        (eshell-mode . corfu-mode))

  :init
  (global-corfu-mode)
  
  :config
  (setq corfu-auto t
        corfu-auto-delay 0.1
        corfu-auto-trigger "." ;; Custom trigger characters
        corfu-quit-no-match 'separator) ;; or t
  ;; Enable optional extension modes:
  ;; (corfu-history-mode)
  ;; (corfu-popupinfo-mode)
  )

;; A few more useful configurations...
(use-package emacs
  :custom
  ;; TAB cycle if there are only few candidates
  (completion-cycle-threshold 3)

  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (tab-always-indent 'complete)

  ;; Emacs 30 and newer: Disable Ispell completion function.
  ;; Try `cape-dict' as an alternative.
  (text-mode-ispell-word-completion nil)

  ;; Hide commands in M-x which do not apply to the current mode.  Corfu
  ;; commands are hidden, since they are not used via M-x. This setting is
  ;; useful beyond Corfu.
  (read-extended-command-predicate #'command-completion-default-include-p))

;; Enable Vertico.
(use-package vertico
  :ensure t
  
  :custom
  ;; (vertico-scroll-margin 0) ;; Different scroll margin
  (vertico-count 20) ;; Show more candidates
  (vertico-resize nil) ;; Grow and shrink the Vertico minibuffer
  (vertico-cycle t) ;; Enable cycling for `vertico-next/previous'
  :init
  (vertico-mode))

;; Emacs minibuffer configurations.
(use-package emacs
  :custom
  ;; Enable context menu. `vertico-multiform-mode' adds a menu in the minibuffer
  ;; to switch display modes.
  (context-menu-mode t)
  ;; Support opening new minibuffers from inside existing minibuffers.
  (enable-recursive-minibuffers t)
  ;; Hide commands in M-x which do not work in the current mode.  Vertico
  ;; commands are hidden in normal buffers. This setting is useful beyond
  ;; Vertico.
  (read-extended-command-predicate #'command-completion-default-include-p)
  ;; Do not allow the cursor in the minibuffer prompt
  (minibuffer-prompt-properties
   '(read-only t cursor-intangible t face minibuffer-prompt)))

;; Add extensions
(use-package cape
  :ensure t
  ;; Bind prefix keymap providing all Cape commands under a mnemonic key.
  ;; Press C-c p ? to for help.
  :bind ("C-c p" . cape-prefix-map) ;; Alternative key: M-<tab>, M-p, M-+
  ;; Alternatively bind Cape commands individually.
  ;; :bind (("C-c p d" . cape-dabbrev)
  ;;        ("C-c p h" . cape-history)
  ;;        ("C-c p f" . cape-file)
  ;;        ...)
  :init
  ;; Add to the global default value of `completion-at-point-functions' which is
  ;; used by `completion-at-point'.  The order of the functions matters, the
  ;; first function returning a result wins.  Note that the list of buffer-local
  ;; completion functions takes precedence over the global list.
  (add-hook 'completion-at-point-functions #'cape-dabbrev)
  (add-hook 'completion-at-point-functions #'cape-file)
  (add-hook 'completion-at-point-functions #'cape-elisp-block)
  (add-hook 'completion-at-point-functions #'cape-history)
  ;; ...
)

(use-package yasnippet
  :ensure t
  :hook
  (prg-mode . yas-minor-mode)
  )

(defun pi2-6-global-set-key (keys func)
  (global-unset-key keys)
  (local-unset-key keys)
  (global-set-key keys func))

(defun pi2-6-reset-keys()
  "Sets all the keybindings at once."
  (interactive)

  (cua-mode)
  
  ;(global-unset-key "C-p")
  ;(local-unset-key  "C-p")
					; -- main functions
  (pi2-6-global-set-key (kbd "M-SPC") 'set-mark-command)
  (pi2-6-global-set-key (kbd "M-a") 'execute-extended-command)
  (pi2-6-global-set-key (kbd "M-ù") 'execute-extended-command) ;; backup in case a mode redefines M-a

					; -- movements within sentences
  (pi2-6-global-set-key (kbd "M-l") 'forward-char)
  (pi2-6-global-set-key (kbd "M-o") 'forward-word)
  (pi2-6-global-set-key (kbd "M-j") 'backward-char)
  (pi2-6-global-set-key (kbd "M-u") 'backward-word)
  (pi2-6-global-set-key (kbd "M-h") 'move-beginning-of-line)
  (pi2-6-global-set-key (kbd "M-m") 'move-end-of-line)
  (pi2-6-global-set-key (kbd "M-i") 'previous-line)
  (pi2-6-global-set-key (kbd "M-k") 'next-line)

					; -- bigger movements
  (pi2-6-global-set-key (kbd "M-p") 'recenter-top-bottom)
  (pi2-6-global-set-key (kbd "C-f") 'helm-occur)
  (pi2-6-global-set-key (kbd "M-;") 'isearch-forward)
  (pi2-6-global-set-key (kbd "M-:") 'isearch-backward)
  (pi2-6-global-set-key (kbd "M-\" g") 'goto-line)
  (pi2-6-global-set-key (kbd "M-\" s") 'pi2-6-save-anchor)
  (pi2-6-global-set-key (kbd "M-\" b") 'pi2-6-back-to-anchor)

                                        ; -- outline
  (pi2-6-global-set-key (kbd "M-é") 'outline-forward-same-level)
  (pi2-6-global-set-key (kbd "M-&") 'outline-backward-same-level)
  (pi2-6-global-set-key (kbd "C-<tab>") 'outline-cycle)
  (pi2-6-global-set-key (kbd "C-M-<tab>") 'outline-cycle-buffer)
  

					; -- advanced interaction with region
					;(pi2-6-global-set-key (kbd "M-\" m") 'pi2-6-improved-selector)

					; -- deleting
  (pi2-6-global-set-key (kbd "M-f") 'delete-char)
  (pi2-6-global-set-key (kbd "M-r") 'kill-word)
  (pi2-6-global-set-key (kbd "M-d") 'delete-backward-char)
  (pi2-6-global-set-key (kbd "M-e") 'backward-kill-word)
  (pi2-6-global-set-key (kbd "M-g") 'kill-line)

					; -- undo/redo
  (pi2-6-global-set-key (kbd "M-z") 'undo)
  (pi2-6-global-set-key (kbd "M-y") 'undo-redo)
  (pi2-6-global-set-key (kbd "M--") 'repeat)

					; -- kill ring
  (pi2-6-global-set-key (kbd "M-c") 'kill-ring-save)
  (pi2-6-global-set-key (kbd "M-x") 'kill-region)
  (pi2-6-global-set-key (kbd "M-v") 'yank)
  (pi2-6-global-set-key (kbd "M-V") 'helm-show-kill-ring)

					; -- more sophisticated text interaction
  (pi2-6-global-set-key (kbd "M-q") 'fill-paragraph)
  (pi2-6-global-set-key (kbd "C-_") 'yas-expand)
  (pi2-6-global-set-key (kbd "M-'") 'comment-dwim)

					; -- insertions
  (pi2-6-global-set-key (kbd "M-\" i") 'pi2-6-insert-time-stamp)
  (pi2-6-global-set-key (kbd "M-\" t") 'pi2-6-insert-current-time)

					; -- rectangle manipulations
  (pi2-6-global-set-key (kbd "C-x r x") 'kill-rectangle)
  (pi2-6-global-set-key (kbd "C-x r c") 'copy-rectangle-as-kill)
  (pi2-6-global-set-key (kbd "C-x r v") 'yank-rectangle)
  (pi2-6-global-set-key (kbd "C-x r n") 'rectangle-number-lines)
  (pi2-6-global-set-key (kbd "C-x r i") 'string-rectangle)

					; -- ispell/flyspell
  (pi2-6-global-set-key (kbd "M-\" l") 'pi2-6-flyspell-mode)


					; -- interacting with buffers
  (pi2-6-global-set-key (kbd "C-<prior>") 'previous-buffer)
  (pi2-6-global-set-key (kbd "C-<next>")  'next-buffer)
  (pi2-6-global-set-key (kbd "C-r")       'revert-buffer)
  (pi2-6-global-set-key (kbd "C-S-b")     'ibuffer)
  (pi2-6-global-set-key (kbd "C-b")       'helm-buffers-list)


					; -- interacting with files
  (pi2-6-global-set-key (kbd "C-n") 'pi2-6-get-empty-file)
  (pi2-6-global-set-key (kbd "C-o") 'pi2-6-find-file-in-poject-or-not)
  (pi2-6-global-set-key (kbd "C-S-o") 'helm-find-files)
  (pi2-6-global-set-key (kbd "M-\" c") 'pi2-6-copy-link-to-current-file)
  (pi2-6-global-set-key (kbd "M-\" o") 'pi2-6-open-terminal-in-directory)
  (pi2-6-global-set-key (kbd "M-\" f") 'pi2-6-open-file-browser-in-directory)
  (pi2-6-global-set-key (kbd "M-à") 'pi2-6-open-dired)

					; -- interacting with windows
  (pi2-6-global-set-key (kbd "M-Q") 'delete-window)
  (pi2-6-global-set-key (kbd "M-s") 'other-window)
  (pi2-6-global-set-key (kbd "M-S") 'delete-other-windows)


					; -- interacting with frames
  (pi2-6-global-set-key (kbd "C-S-n") 'make-frame-command)
  (pi2-6-global-set-key (kbd "C-w")   'kill-buffer)
  (pi2-6-global-set-key (kbd "C-s")   'save-buffer)

					; -- meuporg
  (pi2-6-global-set-key (kbd "C-! u") 'pi2-6-meuporg-update-current-file)
  (pi2-6-global-set-key (kbd "C-! a") 'pi2-6-agenda)
  (pi2-6-global-set-key (kbd "C-! f") 'org-attach-open)
  (pi2-6-global-set-key (kbd "C-! o") 'helm-projectile-find-file-dwim)
  (pi2-6-global-set-key (kbd "C-! s") 'pi2-6-ag-string-in-project)
  (pi2-6-global-set-key (kbd "C-! d") 'xref-find-definitions-other-window)
  (pi2-6-global-set-key (kbd "C-! h") 'lsp-describe-thing-at-point)
  (pi2-6-global-set-key (kbd "C-! b") 'xref-go-back)
  )



(add-hook 'after-init-hook 'pi2-6-reset-keys)
(add-hook 'org-mode-hook 'pi2-6-reset-keys)
(add-hook 'c-mode-common-hook 'pi2-6-reset-keys)

(setq c-default-style "bsd")
(setq-default c-basic-offset 4)
(setq-default indent-tabs-mode nil)

(use-package lsp-mode
  :ensure t

  :config
  (define-key lsp-mode-map [remap xref-find-apropos] #'helm-lsp-workspace-symbol)

  :hook
  (python-mode . lsp)
  (c++-mode . lsp)
  (c-mode . lsp)
  )


(use-package lsp-ui
  :ensure t
  :config
  (setq
   lsp-ui-peek-enable t
   )

  :hook
  (lsp-mode . lsp-ui-mode)
  )

;; (use-package lsp-jedi
;;   :ensure t)

;; (use-package lsp-pyright
;;   :ensure t
;;   :custom (lsp-pyright-langserver-command "pyright") ;; or basedpyright
;;   :hook (python-mode . (lambda ()
;;                          (require 'lsp-pyright)
;;                          (lsp))))  ; or lsp-deferred

;; (add-to-list 'lsp-disabled-clients 'pylsp)
;; (add-to-list 'lsp-disabled-clients 'pyright)
