;;; init.el -*- lexical-binding: t; -*-

(doom!
 :checkers
 syntax                           ; tasing you for every semicolon you forget
 (spell +flyspell)                ; tasing you for misspelling mispelling
 grammar                          ; tasing grammar mistake every you make

 :completion
 (company +childframe)            ; the ultimate code completion backend
 vertico                          ; the search engine of the future

 :editor
 (evil +everywhere)               ; come to the dark side, we have cookies
 file-templates                   ; auto-snippets for empty files
 fold                             ; (nigh) universal code folding
 format                           ; run code-formatters, check README for formatters
 snippets                         ; my elves. They type so I don't have to

 :emacs
 dired                            ; making dired pretty [functional]
 electric                         ; smarter, keyword-based electric-indent
 undo                             ; persistent, smarter undo for your inevitable mistakes
 vc                               ; version-control and Emacs, sitting in a tree

 :email
 (mu4e +gmail)                    ; Best way to stay in touch

 :lang
 cc                               ; Deal with C-type languages
 data                             ; config/data formats
 dhall                            ; Configs guaranteed to terminate
 emacs-lisp                       ; drown in parentheses
 (haskell +lsp)                   ; a language that's lazier than I am
 json                             ; At least it ain't XML
 (markdown +grip)                 ; writing docs for people to ignore
 nix                              ; I hereby declare "nix geht mehr!"
 org                              ; organize your plain life in plain text
 python                           ; beautiful is better than ugly
 (sh +fish)                       ; she sells {ba,z,fi}sh shells on the C xor
 web                              ; the tubes
 yaml                             ; JSON, but readable

 :os
 tty                              ; improve the terminal Emacs experience

 :term
 vterm                            ; the best terminal emulation in Emacs

 :tools
 direnv                           ; use dir-dependent shell-envs
 (eval +overlay)                  ; run code, run (also, repls)
 lookup                           ; navigate your code and its documentation
 lsp                              ; M-x vscode
 magit                            ; a git porcelain for Emacs
 pass                             ; password manager for nerds
 pdf                              ; pdf enhancements
 rgb                              ; creating color strings

 :ui
 doom                             ; what makes DOOM look the way it does
 doom-dashboard                   ; a nifty splash screen for Emacs
 doom-quit                        ; DOOM quit-message prompts when you quit Emacs
 hl-todo                          ; highlight TODO/FIXME/NOTE/DEPRECATED/HACK/REVIEW
 (ligatures +extra)               ; ligatures and symbols to make your code pretty again
 minimap                          ; show a map of the code on the side
 modeline                         ; snazzy, Atom-inspired modeline, plus API
 nav-flash                        ; flash the active line on big moves
 ophints                          ; highlight the region an operation acts on
 (popup +all +defaults)           ; tame sudden yet inevitable temporary windows
 vc-gutter                        ; vcs diff in the fringe
 vi-tilde-fringe                  ; fringe tildes to mark beyond EOB
 window-select                    ; visually switch windows

 ;; Needs to be penultimate section
 :app
 calendar                         ; sync gcal and org-mode
 everywhere                       ; *leave* Emacs!? You must be joking

 ;; Needs to be ultimate section
 :config
 (default +bindings +smartparens) ; Set basic defaults

 )
