;; Autocompletion
(use-package auto-complete
             :config
             (global-auto-complete-mode t)
             (setq ac-auto-show-menu 0.0)    ;; don't delay
             (setq ac-use-quick-help nil)    ;; disable tooltip
             (setq ac-use-menu-map t)
             (define-key ac-menu-map "\C-n" 'ac-next)
             (define-key ac-menu-map "\C-p" 'ac-previous)
             (define-key ac-menu-map "\C-y" 'ac-complete)
             (define-key ac-menu-map "\t" 'ac-complete)
             (define-key ac-menu-map "\r" 'nil)
             (define-key ac-menu-map "\C-e" 'ac-stop))

(provide 'init-auto-complete)
