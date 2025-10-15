(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-splash-screen t)
(setq initial-scratch-message nil)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(global-display-line-numbers-mode 1)
(setq-default show-trailing-whitespace t)
(delete-selection-mode)

(use-package vertico
  :ensure t
  :custom
  (read-file-name-completion-ignore-case t)
  (read-buffer-completion-ignore-case t)
  :init
  (vertico-mode))

(use-package corfu
  :ensure t
  :custom
  (corfu-auto t)
  :init
  (global-corfu-mode))

(use-package consult
  :ensure t
  :bind (("C-c g" . consult-ripgrep)
	 ("C-c i" . consult-imenu)))

(use-package whole-line-or-region
  :ensure t
  :init
  (whole-line-or-region-global-mode))

(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode))

(use-package zenburn-theme
  :ensure t
  :init
  (load-theme 'zenburn t))

(use-package vc
  :custom
  (vc-follow-symlinks t))

(use-package magit
  :ensure t)

(use-package jj-mode
  :vc (:url "https://github.com/bolivier/jj-mode.el"))

(add-to-list 'auto-mode-alist '("\\.mozconfig\\'" . sh-mode))

(use-package bug-reference
  :custom
  (bug-reference-bug-regexp "\\([Bb]ug \\([0-9]+\\)\\)")
  :config
  (setq-default bug-reference-url-format "https://bugzilla.mozilla.org/show_bug.cgi?id=%s")
  :hook ((prog-mode . bug-reference-prog-mode)
	 (org-mode . bug-reference-mode)
	 (magit-mode . bug-reference-mode)))

(use-package move-text
  :ensure t
  :init (move-text-default-bindings))

(use-package org
  :custom
  (org-adapt-indentation t)
  (org-catch-invisible-edits (quote show-and-error))
  (org-imenu-depth 1)
  (org-log-done (quote time))
  (org-todo-keyword-faces (quote (("SKIPPED" . "orange"))))
  (org-todo-keywords (quote ((sequence "TODO" "|" "DONE" "SKIPPED"))))
  (org-enforce-todo-dependencies t))
