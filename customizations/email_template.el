 ;; email config

(setq user-full-name "user full name")
(setq user-mail-address "user email")

;; smtp
(setq smtpmail-smtp-server "email provider smtp")
(setq smtpmail-smtp-service 587)

(setq smtpmail-stream-type 'starttls)

;; email
(setq send-mail-function 'smtpmail-send-it)

(setq
 rmail-primary-inbox-list '("conn str")
 rmail-remote-password-required t
 rmail-mime-prefer-html nil
 )

(setq mm-encrypt-option 'guided)

;; save sent emails
(defun save-sent-email()
  (write-file (format-time-string "path to stored emails") nil))
(add-hook 'message-sent-hook 'save-sent-email)

(add-hook 'message-setup-hook
	  (lambda () (mml-attach-file "path to pubkey" "application/pgp-keys" nil "attachment")))
(add-hook 'message-setup-hook 'mml-secure-message-sign)


