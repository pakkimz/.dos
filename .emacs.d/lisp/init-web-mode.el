;; Web mode
(use-package web-mode
             :mode
             (("\\.css\\'" . web-mode)
              ("\\.html?\\'" . web-mode)
              ("\\.php\\'" . web-mode))
             :config
             (setq web-mode-markup-indent-offset 2)
             (setq web-mode-css-indent-offset 2)
             (setq web-mode-code-indent-offset 2)
             (setq web-mode-enable-auto-closing t)
             (setq web-mode-engines-alist
                   '(("php"    . "\\.html\\'")
                     ("blade"  . "\\.blade\\."))))

(provide 'init-web-mode)
