;; Flycheck active after command M-x flycheck-mode / global-flycheck-mode
(use-package flycheck
             :init
             ; (add-hook 'after-init-hook #'global-flycheck-mode)  ;; auto turn on globally
             :config
             (setq-default flycheck-temp-prefix ".flycheck")
             (setq flymake-no-changes-timeout nil)
             (setq flymake-start-syntax-check-on-newline nil)
             (setq flycheck-check-syntax-automatically '(save mode-enabled)))
; (flycheck-add-mode 'javascript-eslint 'web-mode)     ;; use eslint with web-mode
(flycheck-add-mode 'javascript-eslint 'js2-mode)     ;; use eslint with js2-mode

(provide 'init-flycheck)
