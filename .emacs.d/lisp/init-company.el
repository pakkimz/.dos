(use-package company
             :init
             (add-hook 'after-init-hook 'global-company-mode)

             :custom
             (company-idle-delay 0.0)
             (company-minimum-prefix-length 2)
             (company-format-margin-function nil)         ;; remove abc
             (company-selection-wrap-around t)            ;; cycle back
             ; (company-tng-mode t)                       ;; tab and go

             :bind (:map company-active-map
                         ("C-j" . company-select-next)
                         ("C-k" . company-select-previous)
                         ("C-e" . company-abort)
                         ("C-w" . company-abort)
                         ("C-y" . company-complete-selection)
                         ("<tab>" . company-complete-selection)
                         )
             )

(provide 'init-company)
