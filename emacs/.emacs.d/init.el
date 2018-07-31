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
 '(auto-save-visited-file-name nil)
 '(column-number-mode t)
 '(company-backends
   '(company-nxml company-css company-cmake company-capf company-files company-dabbrev-code company-dabbrev))
 '(custom-enabled-themes '(zenburn))
 '(custom-safe-themes
   '("bfdcbf0d33f3376a956707e746d10f3ef2d8d9caa1c214361c9c08f00a1c8409" default))
 '(delete-selection-mode t)
 '(dumb-jump-max-find-time 30)
 '(dumb-jump-mode t)
 '(dumb-jump-selector 'ivy)
 '(ediff-split-window-function 'split-window-horizontally)
 '(ediff-window-setup-function 'ediff-setup-windows-plain)
 '(eldoc-echo-area-use-multiline-p nil)
 '(global-company-mode t)
 '(global-display-line-numbers-mode t)
 '(global-undo-tree-mode t)
 '(global-whitespace-mode t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(ivy-mode t)
 '(org-agenda-files '("~/Dropbox/org"))
 '(org-imenu-depth 1)
 '(org-startup-indented t)
 '(package-archive-priorities '(("melpa-stable" . 10) ("gnu" . 5) ("melpa" . 0)))
 '(package-archives
   '(("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa-stable" . "https://stable.melpa.org/packages/")
     ("melpa" . "https://melpa.org/packages/")))
 '(package-selected-packages
   '(company counsel delight dumb-jump eglot ivy magit move-text popwin projectile projectile-ripgrep rust-mode ssh-agency undo-tree whole-line-or-region zenburn-theme))
 '(popwin:adjust-other-windows nil)
 '(projectile-completion-system 'ivy)
 '(projectile-enable-caching t)
 '(projectile-indexing-method 'alien)
 '(projectile-mode t nil (projectile))
 '(projectile-switch-project-action 'projectile-dired)
 '(projectile-use-git-grep t)
 '(recentf-mode t)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(vc-follow-symlinks nil)
 '(vc-handled-backends nil)
 '(whitespace-display-mappings nil)
 '(whitespace-style '(face trailing tabs lines-tail space-before-tab))
 '(whole-line-or-region-extensions-alist
   '((copy-region-as-kill whole-line-or-region-copy-region-as-kill nil)
     (kill-region whole-line-or-region-kill-region nil)
     (kill-ring-save whole-line-or-region-kill-ring-save nil)
     (yank whole-line-or-region-yank nil)
     (comment-dwim whole-line-or-region-comment-dwim-2 nil)))
 '(winner-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; For some reason enabling these with customize doesn't work
(whole-line-or-region-mode)
(require 'popwin)
(popwin-mode)

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

(global-set-key (kbd "C-c i") 'counsel-imenu)
(global-set-key (kbd "C-c o") 'ff-find-other-file)
(global-set-key (kbd "C-c B") 'magit-blame)
(global-set-key (kbd "C-c g") 'counsel-rg)
(global-set-key (kbd "C-c G") 'projectile-ripgrep)
(global-set-key (kbd "C-c r") 'counsel-recentf)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c t") 'eshell)

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
