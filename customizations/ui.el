;; ui

(load-theme 'modus-vivendi-tinted)

(setq inhibit-startup-screen t)
;; disable bars
(tool-bar-mode -1)
(menu-bar-mode -1)
(set-face-attribute 'default nil :height 120)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(setq display-line-numbers-type 'relative)
(setq column-number-mode 1)

(pixel-scroll-precision-mode)
