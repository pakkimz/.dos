;; Web mode
(use-package web-mode
             :mode
             (
              ("\\.html?\\'" . web-mode)
              ("\\.php\\'" . web-mode)
              )

             :config
             (setq web-mode-markup-indent-offset 2)
             (setq web-mode-css-indent-offset 2)
             (setq web-mode-code-indent-offset 2)
             (setq web-mode-enable-auto-closing t)

             (setq web-mode-ac-sources-alist
                   '(("css" . (ac-source-css-property))
                     ("html" . (ac-source-words-in-buffer ac-source-abbrev))
                     ("php" . (ac-source-words-in-buffer
                                ac-source-words-in-same-mode-buffers
                                ac-source-dictionary))))

             ; (setq web-mode-engines-alist
             ;       '(("php"    . "\\.html\\'")
             ;         ("blade"  . "\\.blade\\.")))
             )

(provide 'init-web-mode)
