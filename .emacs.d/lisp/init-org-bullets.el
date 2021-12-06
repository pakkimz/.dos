;; Org mode
(use-package org-bullets
             :config
             ; (setq org-adapt-indentation nil)                ;; disable indent
             (setq org-bullets-bullet-list '("•" "➤" "•"))
             (global-set-key "\C-ca" 'org-agenda)
             :init
             (add-hook 'org-mode-hook 'org-bullets-mode 1))

(provide 'init-org-bullets)
