;; ui

(defvar
  light-theme
  'modus-operandi-deuteranopia
  "*My light theme selection.")
(defvar
  dark-theme
  'modus-vivendi-tinted
  "*My dark theme selection.")
(defvar active-theme nil "Active theme selected.")

(defun switch-active-theme ()
  "Switch between light and dark selected theme."
  (interactive)
  (if (eq active-theme light-theme)
      (progn
	(load-theme dark-theme)
	(setq active-theme dark-theme))
    (progn
      (load-theme light-theme)
      (setq active-theme light-theme))))

(global-set-key (kbd "C-c t") 'switch-active-theme)

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
