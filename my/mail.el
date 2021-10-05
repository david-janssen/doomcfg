;;; -*- lexical-binding: t; -*-

;; Make sure we load mu4e
(add-to-list 'load-path "~/.nix-profile/share/emacs/site-lisp/mu4e")

;; Define this before mu4e module is loaded
(setq +mu4e-backend 'offlineimap)

(after! mu4e

  ;; Define gmail account
  (set-email-account!
   "gmail"
   '((mu4e-sent-folder       . "/gmail/all")
     (mu4e-drafts-folder     . "/gmail/drafts")
     (mu4e-trash-folder      . "/gmail/trash")
     (mu4e-refile-folder     . "/gmail/all")
     (smtpmail-smtp-user     . "janssen.dhj@gmail.com")
     (mu4e-compose-signature . "David Janssen"))
   t)

  (setq
   ;; Setup msmtp configuration
   sendmail-program                 "/home/david/.nix-profile/bin/msmtp"
   send-mail-function               #'smtpmail-send-it
   message-sendmail-f-is-evil       t
   message-sendmail-extra-arguments '("--read-envelope-from")
   message-send-mail-function       #'message-send-mail-with-sendmail

  ;; The following optimizations are possible because we use only gmail
  mu4e-index-cleanup    nil
  mu4e-index-lazy-check t

  ;; Bookmarks for commonly used searches
  mu4e-bookmarks
  '(( :name  "unread"
      :query "flag:unread"
      :key   ?u )
    ( :name  "today"
      :query "date:24h..now AND m:/gmail/all"
      :key   ?t)
    ( :name  "toweek"
      :query "date:7d..now AND m:/gmail/all"
      :key   ?w)
    ( :name "drafts"
      :query "m:/gmail/drafts"
      :key   ?d))))
