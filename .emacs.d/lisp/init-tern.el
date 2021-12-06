;; Tern javascript completion
(use-package tern
             :init
             ;; Set web-mode & js2 to tern-mode
             ; (add-hook 'web-mode-hook (lambda () (tern-mode t)))
             (add-hook 'js2-mode-hook (lambda () (tern-mode t)))
             :config
             ;; Disable tern argument
             (setq-default tern-update-argument-hints-async t))
(use-package tern-auto-complete)
(eval-after-load 'tern
                 '(progn
                    (require 'tern-auto-complete)
                    (tern-ac-setup)))

(provide 'init-tern)
