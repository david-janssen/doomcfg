;;; -*- lexical-binding: t; -*-

(map! :map global-map

 ;; UNBIND ---------------------------------------------------------------------
 ;;
 ;; Explicitly unbind everything that we either want to be unbound or wish to
 ;; remap over. This makes it very clear where we are removing functionality.
 ;;

 "C-x C-z" nil
 "C-q"     nil

 (:leader :nv
  "r" nil
  "o" nil)

 ;; UTIL -----------------------------------------------------------------------

 :nv "C-q" #'indent-region
 :nv "C-e" #'align-regexp
 :nv "C-b" #'switch-to-buffer
 (:leader
  :desc "Save & quit, no confirm" "qi" (cmd! (setq confirm-kill-emacs nil)
                                             (save-buffers-kill-terminal t))
  :desc "Open new frame" "mf" #'make-frame
  :desc "Eval buffer"    "be" #'eval-buffer)

 ;; MOVEMENT -------------------------------------------------------------------

 :nv "C-n" #'consult-line

 (:leader
  :desc "jump-char" :nv "e" #'evil-avy-goto-char-2
  :desc "jump-line" :nv "E" #'evil-avy-goto-line
  )

 ;; OFFICE ---------------------------------------------------------------------

 (:leader
  :desc "office" :prefix "o"
  :desc "capture" "c" #'org-capture
  :desc "agenda"  "a" #'my-org-agenda
  :desc "mail"    "m" #'mu4e
  :desc "today"   "t" (cmd! (org-agenda nil "t"))
  :desc "toweek"  "w" (cmd! (org-agenda nil "w"))
  :desc "refile"  "r" #'org-refile
  )

 ;; PROJECT --------------------------------------------------------------------
 
 (:leader
  :desc "project" :prefix "p"
  :desc "replace" :nv "e" #'projectile-replace
  :desc "search"  :nv "/" #'+helm/project-search
  :desc "save"    :nv "s" #'projectile-save-project-buffers
  )

 ;; SMERGE ---------------------------------------------------------------------

 (:leader
  :map smerge-mode-map
  :desc "next conflict"     :nv "m>" #'smerge-next
  :desc "previous conflict" :nv "m>" #'smerge-next
  :desc "next conflict"     :nv "m<" #'smerge-prev
  :desc "keep upper"        :nv "mu" #'smerge-keep-upper
  :desc "keep lower"        :nv "ml" #'smerge-keep-lower
  :desc "keep all"          :nv "ma" #'smerge-keep-all
  )
)



(map!
 (:after company (:map company-active-map
  ( "<return>" nil
    "RET"      nil
    "C-<return>" #'company-complete-selection
    "C-RET"      #'company-complete-selection
    ))))
