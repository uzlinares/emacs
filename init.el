;; My config
(setq custom-file (locate-user-emacs-file "custom.el"))

;; straight
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Packages
(straight-use-package 'use-package)
(setq straight-use-package-by-default t)
(use-package magit)
(use-package zig-mode)
(use-package company
  :config
  (add-hook 'after-init-hook 'global-company-mode))
(use-package ivy
  :config
  (ivy-mode)
  (setopt ivy-use-virtual-buffers t)
  (setopt enable-recursive-minibuffers t))
(use-package go-mode)
(use-package rust-mode)
(use-package vterm)
(use-package yaml-mode)
(use-package auctex)
(use-package exec-path-from-shell)
(use-package fireplace)
(use-package pdf-tools)
(use-package nov)
(use-package elfeed)
(use-package yasnippet
  :config
  (yas-reload-all)
  (add-hook 'prog-mode-hook #'yas-minor-mode))

;; registers and bookmarks
(set-register ?i '(file . "~/.config/emacs/init.el"))
(set-register ?n '(file . "~/org/notes/"))

(setq bookmark-save-flag 1)

(add-to-list 'load-path "~/.config/emacs/customizations")
(load "custom-stuff")
(load "ui")
(load "programming")
(load "email")
(load "keybindings")
(load "org-setup")
(load "dired-setup")
(load "elfeed-setup")
(load custom-file :no-error-if-file-is-missing)
