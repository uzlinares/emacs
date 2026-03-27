;; My config

(setq custom-file (locate-user-emacs-file "custom.el"))

;; Packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(require 'use-package-ensure)
(setq use-package-always-ensure t)
(use-package magit)
(use-package zig-mode)
(use-package company)
(use-package org)
(use-package go-mode)
(use-package rust-mode)
(use-package ivy)
(add-hook 'after-init-hook 'global-company-mode)
(use-package vterm)
(use-package yaml-mode)
(use-package auctex)
(use-package exec-path-from-shell)
(use-package fireplace)
(use-package pdf-tools)
(use-package nov)
(use-package elfeed)
(use-package yasnippet
  :ensure t
  :config
  (yas-reload-all)
  (add-hook 'prog-mode-hook #'yas-minor-mode))

(when (not package-archive-contents)
  (package-refresh-contents))

;; registers and bookmarks
(set-register ?i '(file . "~/.config/emacs/init.el"))
(set-register ?n '(file . "~/org/notes/"))

(setq bookmark-save-flag 1)

(add-to-list 'load-path "~/.config/emacs/customizations")
(load "custom-stuff.el")
(load "ui.el")
(load "programming.el")
(load "email.el")
(load "keybindings.el")
(load "org-setup.el")
(load "dired-setup.el")
(load "elfeed-setup.el")
