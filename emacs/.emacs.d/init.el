(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(defun my-package-ensure-installed (package)
  "Ensures a specified package is installed."
  (unless (package-installed-p package)
    (unless package-archive-contents
      (package-refresh-contents))
    (package-install package)))

;; UI

(tool-bar-mode -1)
(scroll-bar-mode -1)
(column-number-mode)
(global-display-line-numbers-mode)
(customize-set-variable 'inhibit-startup-screen t)
(my-package-ensure-installed 'zenburn-theme)
(load-theme 'zenburn t)

(my-package-ensure-installed 'ivy)
(my-package-ensure-installed 'counsel)
(ivy-mode)

(customize-set-variable 'whitespace-display-mappings nil)
(customize-set-variable 'whitespace-style '(face trailing tabs space-before-tab))
(global-whitespace-mode)

;; File handling

(customize-set-variable 'make-backup-files nil)
(auto-save-visited-mode)
(global-auto-revert-mode)
(recentf-mode)
(global-set-key (kbd "C-c r") 'counsel-recentf)

;; Editing

(customize-set-variable 'indent-tabs-mode nil)
(delete-selection-mode)

(my-package-ensure-installed 'ws-butler)
(ws-butler-global-mode)

(global-set-key (kbd "M-y") 'counsel-yank-pop)

(my-package-ensure-installed 'undo-tree)
(global-undo-tree-mode)

(my-package-ensure-installed 'move-text)
(global-set-key (kbd "M-<up>") 'move-text-up)
(global-set-key (kbd "M-<down>") 'move-text-down)

(my-package-ensure-installed 'whole-line-or-region)
(whole-line-or-region-global-mode)

(my-package-ensure-installed 'multiple-cursors)
(global-set-key (kbd "C-.") 'mc/mark-all-dwim)

(my-package-ensure-installed 'company)
(customize-set-variable 'company-backends '(company-capf company-files company-dabbrev-code company-dabbrev))
(customize-set-variable 'company-dabbrev-downcase nil)
(customize-set-variable 'company-dabbrev-code-ignore-case nil)
(global-company-mode)

(my-package-ensure-installed 'clang-format)
(my-package-ensure-installed 'clang-format+)
(customize-set-variable 'clang-format+-context 'modification)
(add-hook 'c++-mode-hook #'clang-format+-mode)

(my-package-ensure-installed 'lsp-mode)
(require 'lsp-mode)
(customize-set-variable 'lsp-rust-server 'rust-analyzer)

;; Navigation

(global-set-key (kbd "C-c i") 'counsel-imenu)

(my-package-ensure-installed 'dumb-jump)
(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)

(my-package-ensure-installed 'ivy-xref)
(customize-set-variable 'xref-show-definitions-function #'ivy-xref-show-defs)

(my-package-ensure-installed 'projectile)
(customize-set-variable 'projectile-completion-system 'ivy)
(customize-set-variable 'projectile-enable-caching t)
(customize-set-variable 'projectile-indexing-method 'alien)
(customize-set-variable 'projectile-switch-project-action 'projectile-dired)
(projectile-mode)
(global-set-key (kbd "C-c p") 'projectile-command-map)

(my-package-ensure-installed 'ripgrep)
(global-set-key (kbd "C-c g") 'counsel-rg)
(global-set-key (kbd "C-c G") 'ripgrep-regexp)

(global-set-key (kbd "C-c o") 'ff-find-other-file)

(customize-set-variable 'ediff-window-setup-function #'ediff-setup-windows-plain)

(my-package-ensure-installed 'magit)
(customize-set-variable 'magit-display-buffer-function 'magit-display-buffer-same-window-except-diff-v1)
(global-set-key (kbd "C-c B") 'magit-blame-addition)

;; Org

(my-package-ensure-installed 'org)
(customize-set-variable 'org-agenda-files '("~/org"))
(customize-set-variable 'org-catch-invisible-edits (quote show-and-error))
(customize-set-variable 'org-imenu-depth 1)
(customize-set-variable 'org-log-done (quote time))
(customize-set-variable 'org-todo-keyword-faces (quote (("SKIPPED" . "orange"))))
(customize-set-variable 'org-todo-keywords (quote ((sequence "TODO" "|" "DONE" "SKIPPED"))))
(global-set-key (kbd "C-c a") 'org-agenda-list)

(my-package-ensure-installed 'idle-org-agenda)
(require 'idle-org-agenda)
(customize-set-variable 'idle-org-agenda-interval 3600)
(idle-org-agenda-mode)

(my-package-ensure-installed 'orgit)

(my-package-ensure-installed 'org-download)
(customize-set-variable 'org-download-method 'attach)
(require 'org-download)

;; Languages

(my-package-ensure-installed 'rust-mode)
(my-package-ensure-installed 'kotlin-mode)
(my-package-ensure-installed 'glsl-mode)
(my-package-ensure-installed 'groovy-mode)

(add-to-list 'auto-mode-alist '("\\.mozconfig\\'" . sh-mode))

;; Misc
(require 'ansi-color)
(defun endless/colorize-compilation ()
  "Colorize from `compilation-filter-start' to `point'."
  (let ((inhibit-read-only t))
    (ansi-color-apply-on-region
     compilation-filter-start (point))))

(add-hook 'compilation-filter-hook
          #'endless/colorize-compilation)
