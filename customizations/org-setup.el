;; org
(setq org-directory "~/org/")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-agenda-files '("agenda.org" "inbox.org"))

;; agenda
(setq org-agenda-include-diary t)
;; (setq org-agenda-span 15)
(setq org-refile-use-outline-path t)
(setq org-refile-targets
      '(("agenda.org" . (:level . 1))))

(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)
(global-set-key (kbd "C-c j") (lambda () (interactive) (find-file "~/org/journal.org")))
(global-set-key (kbd "C-c o") (lambda () (interactive) (find-file "~/org/agenda.org")))

(setq org-capture-templates
      '(("t" "TODO" entry (file+headline "~/org/agenda.org" "Inbox")
	 "* TODO %?\n/Entered on %U/ %i\n")
	("j" "Journal" entry (file+olp+datetree "~/org/journal.org")
	 "* %?\nEntered on %U\n %i\n")))

(add-hook 'org-mode-hook 'auto-fill-mode)
