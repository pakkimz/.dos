;; Js2 mode
(use-package js2-mode
             :init
             (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
             ;; Better imenu
             (add-hook 'js2-mode-hook #'js2-imenu-extras-mode)
             :config
             ;; Disable syntax checker js2-mode
             (setq js2-mode-show-parse-errors nil)
             (setq js2-mode-show-strict-warnings nil))

(provide 'init-js2-mode)
