;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-visited-mode t)
 '(column-number-mode t)
 '(company-backends
   (quote
    (company-lsp company-nxml company-css company-cmake company-capf company-files company-dabbrev-code company-dabbrev)))
 '(company-dabbrev-downcase nil)
 '(company-dabbrev-ignore-case t)
 '(delete-selection-mode t)
 '(ediff-split-window-function (quote split-window-horizontally))
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(eldoc-echo-area-use-multiline-p nil)
 '(global-auto-revert-mode t)
 '(global-company-mode t)
 '(global-display-line-numbers-mode t)
 '(global-undo-tree-mode t)
 '(global-whitespace-mode t)
 '(idle-org-agenda-interval 600)
 '(idle-org-agenda-mode t nil (idle-org-agenda))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(ivy-mode t)
 '(notmuch-search-oldest-first nil)
 '(org-agenda-files (quote ("~/org")))
 '(org-catch-invisible-edits (quote show-and-error))
 '(org-imenu-depth 1)
 '(org-log-done (quote time))
 '(org-startup-indented t)
 '(org-todo-keyword-faces (quote (("SKIPPED" . "orange"))))
 '(package-archive-priorities (quote (("melpa-stable" . 10) ("gnu" . 5) ("melpa" . 0))))
 '(package-archives
   (quote
    (("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa-stable" . "https://stable.melpa.org/packages/")
     ("melpa" . "https://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (ccls company company-lsp counsel delight glsl-mode groovy-mode idle-org-agenda ivy lsp-mode magit move-text multiple-cursors notmuch projectile ripgrep rust-mode undo-tree whole-line-or-region winum zenburn-theme)))
 '(projectile-completion-system (quote ivy))
 '(projectile-enable-caching t)
 '(projectile-indexing-method (quote alien))
 '(projectile-mode t nil (projectile))
 '(projectile-switch-project-action (quote projectile-dired))
 '(projectile-use-git-grep t)
 '(recentf-mode t)
 '(ring-bell-function (quote ignore))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(vc-follow-symlinks nil)
 '(vc-handled-backends nil)
 '(whitespace-display-mappings nil)
 '(whitespace-style (quote (face trailing tabs lines-tail space-before-tab)))
 '(whole-line-or-region-extensions-alist
   (quote
    ((copy-region-as-kill whole-line-or-region-copy-region-as-kill nil)
     (kill-region whole-line-or-region-kill-region nil)
     (kill-ring-save whole-line-or-region-kill-ring-save nil)
     (yank whole-line-or-region-yank nil)
     (comment-dwim whole-line-or-region-comment-dwim-2 nil))))
 '(winner-mode t)
 '(winum-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'zenburn t)

;; For some reason enabling these with customize doesn't work
(whole-line-or-region-mode)

;; Remove unwanted stuff from the mode line
(delight '((abbrev-mode nil abbrev)
           (auto-revert-mode nil autorevert)
           (company-mode nil company)
           (eldoc-mode nil eldoc)
           (ivy-mode nil ivy)
           (org-indent-mode nil org-indent)
           (projectile-mode nil projectile)
           (undo-tree-mode nil undo-tree)
           (global-whitespace-mode nil whitespace)
           (whole-line-or-region-mode nil whole-line-or-region)))

(global-set-key (kbd "M-<up>") 'move-text-up)
(global-set-key (kbd "M-<down>") 'move-text-down)
(global-set-key (kbd "M-y") 'counsel-yank-pop)
(global-set-key (kbd "C-.") 'mc/mark-all-dwim)

(global-set-key (kbd "C-c i") 'counsel-imenu)
(global-set-key (kbd "C-c o") 'ff-find-other-file)
(global-set-key (kbd "C-c B") 'magit-blame-addition)
(global-set-key (kbd "C-c g") 'counsel-rg)
(global-set-key (kbd "C-c G") 'ripgrep-regexp)
(global-set-key (kbd "C-c r") 'counsel-recentf)
(global-set-key (kbd "C-c a") 'org-agenda-list)
(global-set-key (kbd "C-c t") 'eshell)
(global-set-key (kbd "C-c m") 'notmuch)

(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(define-key winum-keymap (kbd "M-0") #'winum-select-window-0)
(define-key winum-keymap (kbd "M-1") #'winum-select-window-1)
(define-key winum-keymap (kbd "M-2") #'winum-select-window-2)
(define-key winum-keymap (kbd "M-3") #'winum-select-window-3)
(define-key winum-keymap (kbd "M-4") #'winum-select-window-4)
(define-key winum-keymap (kbd "M-5") #'winum-select-window-5)
(define-key winum-keymap (kbd "M-6") #'winum-select-window-6)
(define-key winum-keymap (kbd "M-7") #'winum-select-window-7)
(define-key winum-keymap (kbd "M-8") #'winum-select-window-8)
(define-key winum-keymap (kbd "M-9") #'winum-select-window-9)

(defun file-name-and-line-number-to-clipboard ()
  "Copy the buffer's file name and current line number to the clipboard."
  (interactive)
  (let ((file-name (buffer-file-name)))
    (if file-name
        (let ((file-name-and-line-number
               (format "%s:%d" file-name (line-number-at-pos))))
          (kill-new file-name-and-line-number)
          (message "Copied '%s' to the clipboard." file-name-and-line-number))
      (error "Current buffer has no associated file."))))
(global-set-key (kbd "C-c l") 'file-name-and-line-number-to-clipboard)

(require 'lsp-mode)
(require 'ccls)
(add-hook 'rust-mode-hook #'lsp)
(if (not (eq system-type 'windows-nt))
    (add-hook 'c++-mode-hook #'lsp))

(require 'ansi-color)
(defun endless/colorize-compilation ()
  "Colorize from `compilation-filter-start' to `point'."
  (let ((inhibit-read-only t))
    (ansi-color-apply-on-region
     compilation-filter-start (point))))

(add-hook 'compilation-filter-hook
          #'endless/colorize-compilation)
