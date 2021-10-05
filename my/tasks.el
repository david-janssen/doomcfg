;;; -*- lexical-binding: t; -*-

(add-to-list 'auto-mode-alist '("\\.note\\'" . org-mode))

(defun my-org-agenda () (interactive) "Load my agenda" (org-agenda nil "a"))

(defconst my-bucket-file "/home/david/dcs/notes/org/bucket.note")
(defconst my-gcal-file   "/home/david/dcs/notes/org/gcal.note")
(defconst my-today-file  "/home/david/dcs/notes/org/diary/today.note")
(defconst my-toweek-file "/home/david/dcs/notes/org/diary/toweek.note")

(setq
   ;; Configure gcal integration
   org-gcal-client-id     "641008722033-qvqltimp1db7omqt1ll9dmk41tn1gras.apps.googleusercontent.com"
   org-gcal-client-secret (string-trim (shell-command-to-string "pass web/calendar-access-token"))
   org-gcal-fetch-file-alist `(("janssen.dhj@gmail.com" . ,my-gcal-file)))

(after! org

  (add-to-list 'org-modules 'org-habit 'org-mu4e)

  (add-hook 'org-mode-hook (lambda () (auto-fill-mode)))

  (setq

   ;; General org stuff
   org-directory        (expand-file-name "~/dcs/notes/org")
   org-ellipsis         " ▼ "
   org-startup-folded   nil
   org-startup-indented t

   ;; TODOS --------------------------------------------------------------------

   ;; Keep track of state-changes, but hide them in a drawer
   org-log-into-drawer  t

   ;; Which keywords we support
   org-todo-keywords '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!)")
                       (sequence "WAIT(w@/!)" "|" "CANCELED(c@/!)"))

   ;; AGENDA -------------------------------------------------------------------

   ;; What files we use for our agenda
   org-agenda-files       `(,my-bucket-file ,my-toweek-file ,my-today-file ,my-gcal-file)
   org-agenda-file-regexp "\\`[^.].*\\(\\.org\\|\\.note\\)\\'"

   ;; What we want our agenda to display
   org-agenda-custom-commands
   '(("t" "today"
      ((agenda
        ""
        ((org-agenda-span 1)
         (org-agenda-start-day "0d")))
       (todo "NEXT" ((org-agenda-overriding-header "Next actions")))
       (todo "TODO" ((org-agenda-overriding-header "Tasks")))))
     ("w" "week"
      ((agenda
        ""
        ((org-agenda-span 7)
         (org-agenda-start-day "0d")))))
     )


  ;; CAPTURE -------------------------------------------------------------------

  ;; Where capture writes to
  org-default-notes-file "~/dcs/notes/org/bucket.note"

  ;; Setting up org-capture
  org-capture-templates
  '(;; Capture general todo entries
    ("t" "todo" entry (file+olp "" "tasks")
     "* TODO %?\ncreated: %U\n"
     :kill-buffer t)

    ("n" "next" entry (file+olp "" "tasks")
     "* NEXT %?\ncreated: %U\n"
     :kill-buffer t)

    ("d" "on day" entry (file+olp "" "tasks")
     "* TODO %?\ncreated: %U\nscheduled: %^t\n"
     :kill-buffer t)

    ("i" "on time" entry (file+olp "" "tasks")
     "* TODO %?\ncreated: %U\nscheduled: %^T\n"
     :kill-buffer t))

    ;; Capture a 'reply-to-email' task
    ;; ("r" "reply" entry (file "~/dcs/org/refile.org")
    ;;  "* NEXT Respond to %?\nSCHEDULED: %t\n%U\n%a\n"
    ;;  :kill-buffer t)
    ;; )

  ;; REFILE --------------------------------------------------------------------

  org-refile-targets '((org-agenda-files :maxlevel . 3))
  ))
