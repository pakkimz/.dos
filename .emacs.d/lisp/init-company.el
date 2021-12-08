(use-package company
             :init
             (add-hook 'after-init-hook 'global-company-mode)

             :custom
             (company-idle-delay 0.0)
             (company-minimum-prefix-length 2)
             (company-format-margin-function nil)       ;; remove abc
             (company-tng-mode t)                       ;; always show menu even only one

             :bind (:map company-active-map
                         ("C-j" . company-select-next)
                         ("C-k" . company-select-previous)
                         ("C-y" . company-complete-selection)
                         ("C-e" . company-abort)
                         ("C-w" . company-abort)
                         )
             )

(provide 'init-company)
