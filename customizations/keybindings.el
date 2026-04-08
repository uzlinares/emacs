;; keybindings

(global-set-key (kbd "C-x K") 'nuke-all-buffers)

(global-set-key [remap list-buffers] 'ibuffer)
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "C-c v") 'view-file)

(global-set-key (kbd "C-c m") 'rmail)

(defun clear-eshell-screen ()
  (interactive)
  (eshell/clear t)
  (eshell-send-input))

(add-hook 'eshell-mode-hook
	  (lambda ()
	    (keymap-set eshell-mode-map "C-l" 'clear-eshell-screen)))
