;; custom stuff

;; close all buffers
(defun nuke-all-buffers ()
  (interactive)
  (mapcar 'kill-buffer (buffer-list))
  (delete-other-windows))

;; load bashrc file
(exec-path-from-shell-initialize)

;; make vterm the default terminal in projects
(defun my-project-shell ()
  "Start an inferior shell in the current project's root directory.
If a buffer already exists for running a shell in the project's root,
switch to it.  Otherwise, create a new shell buffer.
With \\[universal-argument] prefix arg, create a new inferior shell buffer even
if one already exists."
  (interactive)
  (require 'comint)
  (let* ((default-directory (project-root (project-current t)))
         (default-project-shell-name (project-prefixed-buffer-name "shell"))
         (shell-buffer (get-buffer default-project-shell-name)))
    (if (and shell-buffer (not current-prefix-arg))
        (if (comint-check-proc shell-buffer)
            (pop-to-buffer shell-buffer (bound-and-true-p display-comint-buffer-action))
          (vterm shell-buffer))
      (vterm (generate-new-buffer-name default-project-shell-name)))))

(advice-add 'project-shell :override #'my-project-shell)

;; pdf
(pdf-tools-install)

;; epub
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

;; generate an email alias
(defun generate-email-alias (suffix strategy)
  "Generate an email alias."
  (interactive "sProvide the suffix:\nsProvide the strategy:")
  (let ((alias (shell-command-to-string (format "alias-generator --emacs-output %s %s" suffix strategy))))
    (message "Your email alias is %s." alias)
    (kill-new alias)))
