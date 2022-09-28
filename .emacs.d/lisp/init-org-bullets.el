;; set maximum indentation for description lists
(setq org-list-description-max-indent 5)
;; prevent demoting heading also shifting text inside sections
(setq org-adapt-indentation nil)

;; Org mode
(use-package org-bullets
             :config
             ; (setq org-adapt-indentation nil)                ;; disable indent
             (setq org-bullets-bullet-list '("•" "➤" "•"))
             (global-set-key "\C-ca" 'org-agenda)
             :init
             (add-hook 'org-mode-hook 'org-bullets-mode 1))

(provide 'init-org-bullets)
