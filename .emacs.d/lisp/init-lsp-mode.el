(use-package lsp-mode

             :commands
             (lsp lsp-deferred)

             :custom
             (lsp-diagnostics-provider :none)
             (lsp-lens-enable nil)
             (lsp-eldoc-enable-hover nil)
             (lsp-headerline-breadcrumb-enable nil)
             (lsp-modeline-code-actions-enable nil)
             (lsp-modeline-diagnostics-enable nil)
             (lsp-signature-auto-activate nil)
             (lsp-signature-render-documentation nil)
             (lsp-completion-show-detail nil)
             (lsp-completion-show-kind nil)

             :hook
             (js-mode . lsp-deferred)
             (css-mode . lsp-deferred)
             (c-mode . lsp-deferred)
             (c++-mode . lsp-deferred)
             (html-mode . lsp-deferred)
             (lsp-mode . company-mode)

             )

(provide 'init-lsp-mode)
