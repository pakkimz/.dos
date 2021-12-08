(use-package rjsx-mode
             :init
             (add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))
             )

(provide 'init-rjsx-mode)
