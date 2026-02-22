;; programming

;; auctex
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(setq TeX-parse-self t) ; Enable parse on load.
(setq TeX-auto-save t) ; Enable parse on save.

;; go config
(add-hook 'go-mode-hook 'eglot-ensure)
(add-hook 'before-save-hook 'gofmt-before-save)

;; rust config
(add-hook 'rust-mode-hook 'eglot-ensure)

(add-to-list 'auto-mode-alist '("\\.tmpl\\'" . html-mode))

;; C/C++
(setq c-default-style "cc-mode")

;; magit
(setq magit-display-buffer-function 'magit-display-buffer-fullframe-status-v1) ;; make magit-status fill entire frame
