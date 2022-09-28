(use-package lsp-mode

             :commands
             (lsp lsp-deferred)

             :custom
             (lsp-enable-which-key-integration t)
             (lsp-keymap-prefix "C-c l")
             (lsp-log-io nil)
             (lsp-idle-delay 0.500)
             ; (lsp-diagnostics-provider :none)
             (lsp-lens-enable nil)
             (lsp-eldoc-enable-hover nil)
             (lsp-headerline-breadcrumb-enable nil)
             (lsp-modeline-code-actions-enable nil)
             (lsp-modeline-diagnostics-enable nil)
             (lsp-signature-auto-activate nil)
             (lsp-signature-render-documentation nil)
             (lsp-completion-show-detail nil)
             (lsp-completion-show-kind t)

             :hook
             (js-mode . lsp-deferred)
             (css-mode . lsp-deferred)
             (c-mode . lsp-deferred)
             (c++-mode . lsp-deferred)
             (html-mode . lsp-deferred)
             (python-mode . lsp-deferred)
             (lsp-mode . company-mode)

             )

(use-package php-mode
             :hook
             (php-mode . lsp-deferred))

;; Keymap
;; Ctrl-alt i (complation at point) to see what available completion in cursor
;; npm i -g intelephense -- backend for php

;; flymake-show-diagnostics-buffer commands to show what error

(provide 'init-lsp-mode)
