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

(use-package savehist
             :init
             (savehist-mode)
             )

(use-package consult
             :bind
             ("C-x b" . consult-buffer)
             ("M-s l" . consult-line)
             )

;; Key-binding
; C-x C-f find file
; C-x C-r find recent file
; C-x b   buffer
; C-s     search

(provide 'init-vertico)
