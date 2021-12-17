;; Recent file or mru
(use-package recentf
             :config
             (recentf-mode 1)
             (setq recentf-max-menu-items 25))

(use-package which-key
             :diminish
             :init
             (which-key-mode)
             :custom
             (which-key-setup-minibuffer)
             )

(use-package smex
             :defines smex-save-file
             :config
             (smex-initialize))

(use-package counsel)

;; Ivy
(use-package ivy
             :diminish (ivy-mode . "")
             :init (ivy-mode 1) ; globally at startup
             :config
             (setq ivy-use-virtual-buffers t)
             (setq enable-recursive-minibuffers t)
             (setq ivy-count-format "%d/%d ")
             (setq ivy-ignore-buffers '("\\` " "\\`\\*"))

             :bind (:map ivy-switch-buffer-map
                         ("C-j" . ivy-next-line)
                         ("C-k" . ivy-previous-line)
                         ("C-y" . ivy-done)
                         )
             :bind (:map ivy-minibuffer-map
                         ("C-j" . ivy-next-line)
                         ("C-k" . ivy-previous-line)
                         ("C-y" . ivy-done)
                         )
             )

(with-eval-after-load 'ivy
                      (global-set-key "\C-s" 'swiper)
                      (global-set-key "\M-x" 'counsel-M-x)
                      (global-set-key (kbd "C-x C-f") 'counsel-find-file)
                      (global-set-key (kbd "C-x C-r") 'counsel-recentf)
                      (global-set-key (kbd "\C-w") 'counsel-up-directory))

;; Key-binding
; C-x C-f find file
; C-x C-r find recent file
; C-x b   buffer
; C-s     search

(provide 'init-ivy)
