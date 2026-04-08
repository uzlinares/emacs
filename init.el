;; My config

;; straight bootstrap
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
(setq use-package-always-defer t)

(use-package emacs
  :init
  (setq custom-file (locate-user-emacs-file "custom.el"))
  (load custom-file)
  (setq-default bidi-display-reordering 'left-to-right
		bidi-paragraph-direction 'left-to-right)
  (setq bidi-inhibit-bpa t)
  (setq redisplay-skip-fontification-on-input t)
  (setq read-process-output-max (* 4 1024 1024))
  (setq save-interprogram-paste-before-kill t)
  (setq window-combination-resize t)
  (setq set-mark-command-repeat-pop t)
  (setq help-window-select t)
  (setq repeat-mode t))
(use-package magit
  :bind ("C-c g" . magit)
  :demand t)
(use-package zig-mode)
(use-package company
  :demand t
  :config
  (add-hook 'after-init-hook 'global-company-mode))
(use-package ivy
  :demand t
  :config
  (ivy-mode)
  (setopt enable-recursive-minibuffers t))
(use-package go-mode)
(use-package rust-mode)
(use-package vterm)
(use-package yaml-mode)
(use-package auctex)
(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))
(use-package pdf-tools
  :config
  (pdf-tools-install))
(use-package nov
  :config
  (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode)))
(use-package elfeed
  :demand t
  :bind ("C-c n" . elfeed))
(use-package yasnippet
  :demand t
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

(load "ox-md")
