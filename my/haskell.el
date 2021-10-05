;;; ~/opt/dotfiles/dotfiles/.config/doom/+haskell.el -*- lexical-binding: t; -*-
(after! haskell

  ;; Basic config -------------------------------------------------------------

  ;; We rely on lorri to make sure that ghci points to the right executable
  ;; (setq haskell-process-type 'cabal-repl)
  (setq haskell-process-type 'stack-ghci)


  ;; Exclude session buffer from popups ---------------------------------------
  ;; Prefix all haskell-session buffers with 'ih-'
  (defun haskell-session-default-name ()
    "Generate a default project name for the new project prompt."
    (let ((file (haskell-cabal-find-file)))
      (seq-concatenate 'string "ih-"
                       (or (when file
                             (downcase (file-name-sans-extension
                                        (file-name-nondirectory file))))
                           "haskell"))))

  ;; Exclude all 'ih-' buffers from popup-management
  (set-popup-rule! "^\*ih-.*" :ignore t)

  ;; Disable company-mode, more annoying than useful ---------------------------
  (add-hook 'haskell-mode-hook (lambda () (company-mode 0)))

  ;; Customize haskell keybindings ---------------------------------------------
  (map!
   :map haskell-mode-map
   :nv "]e" #'flycheck-next-error
   :nv "[e" #'flycheck-previous-error
   )
  )
