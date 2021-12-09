;; Recent file or mru
(use-package recentf
             :config
             (recentf-mode 1)
             (setq recentf-max-menu-items 25))

;; Use vertico extensions
(straight-use-package '( vertico :files (:defaults "extensions/*")
                                 :includes (vertico-buffer
                                             vertico-directory
                                             vertico-flat
                                             vertico-indexed
                                             vertico-mouse
                                             vertico-quick
                                             vertico-repeat
                                             vertico-reverse)))

(use-package vertico
             :bind (:map vertico-map
                         ("C-y" . vertico-insert)
                         ("C-j" . vertico-next)
                         ("C-k" . vertico-previous)
                         ; :map minibuffer-local-map
                         ; ("C-w" . backward-kill-word)
                         ("C-w" . vertico-directory-delete-word)
                         )

             :custom
             (vertico-cycle t)
             :init
             (vertico-mode)
             )

(use-package orderless
             :init
             (setq completion-styles '(orderless)
                   completion-category-defaults nil
                   completion-category-overrides '((file (styles partial-completion)))))

(use-package savehist
             :init
             (savehist-mode)
             )

(use-package consult
             :custom
             (consult-preview-key nil)          ; disable preview

             :bind
             ("C-x C-r" . consult-recent-file)
             ("C-x b" . consult-buffer)
             ("C-s" . consult-line)
             )

;; Key-binding
; C-x C-f find file
; C-x C-r find recent file
; C-x b   buffer
; C-s     search

(provide 'init-vertico)
