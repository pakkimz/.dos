;; Recent file or mru
(use-package recentf
             :config
             (recentf-mode 1)
             (setq recentf-max-menu-items 25))

(use-package vertico
             :bind (:map vertico-map
                         ("C-j" . vertico-next)
                         ("C-k" . vertico-previous)
                         :map minibuffer-local-map
                         ("C-w" . backward-kill-word)
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
