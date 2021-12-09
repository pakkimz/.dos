(use-package irony
             :hook
             (c++-mode-hook . irony-mode)
             (c-mode-hook . irony-mode)
             (irony-mode-hook . irony-cdb-autosetup-compile-options)

             :config
             ;; Windows performance tweaks
             ;;
             (when (boundp 'w32-pipe-read-delay)
               (setq w32-pipe-read-delay 0))
             ;; Set the buffer size to 64K on Windows (from the original 4K)
             (when (boundp 'w32-pipe-buffer-size)
               (setq irony-server-w32-pipe-buffer-size (* 64 1024)))
             )

(use-package company-irony
             :config
             (progn
               (eval-after-load 'company '(add-to-list 'company-backends 'company-irony)))
             )

(provide 'init-irony)
