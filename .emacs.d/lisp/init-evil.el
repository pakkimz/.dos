(use-package undo-fu)
(setq evil-want-C-u-scroll t)

(use-package evil
             :demand t
             :config
             (setq evil-want-keybinding nil)
             (setq evil-undo-system 'undo-fu)          ;; use undo-fu for system undo
             (setq-default evil-shift-width 2)         ;; set shiftwidth when >>
             (evil-set-leader 'normal (kbd "SPC"))     ;; leader key
             (evil-mode 1))

;; (use-package evil-collection
;;              :after evil
;;              (setq evil-want-integration t)
;;              (evil-collection-init))

(use-package evil-matchit
             :after evil
             :init
             (global-evil-matchit-mode 1))

(use-package evil-exchange
             :after evil
             :init
             (evil-exchange-cx-install))

(use-package evil-surround
             :after evil
             :config
             (global-evil-surround-mode 1))

(use-package evil-replace-with-register
             :after evil
             :init
             (setq evil-replace-with-register-key (kbd "gr"))
             (evil-replace-with-register-install))

(use-package evil-commentary
             :diminish
             :after evil
             :config
             (evil-commentary-mode))

(use-package drag-stuff
             :diminish
             :after evil
             :config
             (drag-stuff-global-mode 1))

(use-package evil-textobj-entire
             :after evil
             :bind (:map evil-outer-text-objects-map
                         ("e" . evil-entire-entire-buffer))
             :bind (:map evil-inner-text-objects-map
                         ("e" . evil-entire-entire-buffer)))

(require 'evil-unimpaired)
(evil-unimpaired-mode)

(with-eval-after-load 'evil-maps
                      (define-key evil-normal-state-map "Y" 'djoyner/copy-to-end-of-line)
                      (define-key evil-visual-state-map (kbd ">") 'djoyner/evil-shift-right-visual)
                      (define-key evil-visual-state-map (kbd "<") 'djoyner/evil-shift-left-visual)
                      (define-key evil-insert-state-map (kbd "\C-h") 'delete-backward-char)                 ;; one character
                      ; (define-key evil-insert-state-map (kbd "\C-h") 'backspace-whitespace-to-tab-stop)     ;; according tab space
                      (define-key evil-normal-state-map "\C-j" 'drag-stuff-down)
                      (define-key evil-normal-state-map "\C-k" 'drag-stuff-up)
                      (define-key evil-normal-state-map "\C-l" 'next-buffer)
                      (define-key evil-normal-state-map "\C-h" 'previous-buffer)
                      (define-key evil-normal-state-map (kbd "g.") 'goto-last-change)
                      (define-key evil-normal-state-map (kbd "<leader>O") 'only-current-buffer)
                      (define-key evil-normal-state-map (kbd "<leader>w") 'save-buffer)
                      (define-key evil-normal-state-map (kbd "<leader>r") 'kill-this-buffer)
                      (define-key evil-normal-state-map (kbd "<leader>q") 'save-buffers-kill-terminal)
                      (define-key evil-insert-state-map (kbd "C-SPC") 'evil-force-normal-state)
                      (define-key evil-normal-state-map (kbd "C-SPC") 'evil-ex-nohighlight)
                      (define-key evil-visual-state-map (kbd "C-SPC") 'evil-force-normal-state)
                      ; (define-key evil-ex-completion-map (kbd "C-SPC") (kbd "C-c"))
                      (define-key evil-insert-state-map "\C-a" 'beginning-of-line)
                      (define-key evil-insert-state-map "\C-e" 'end-of-line)
                      (define-key evil-insert-state-map (kbd "TAB") 'tab-to-tab-stop)
                      (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
                      (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
                      (define-key evil-normal-state-map "u" 'undo-fu-only-undo)
                      (define-key evil-normal-state-map "\C-r" 'undo-fu-only-redo))

(use-package neotree
             :after evil
             :config
             (setq neo-theme 'icon)
             (setq-default neo-show-hidden-files t)
             (global-set-key [f1] 'neotree-toggle)
             (global-set-key [f2] 'my-neotree-project-dir-toggle)      ;; find directory
             :init
             (add-hook 'neo-after-create-hook
                       (lambda (&rest _) (display-line-numbers-mode -1)))
             (add-hook 'neotree-mode-hook
                       (lambda ()
                         (define-key evil-normal-state-local-map (kbd "s") 'neotree-enter-vertical-split)
                         (define-key evil-normal-state-local-map (kbd "i") 'neotree-enter-horizontal-split)
                         (define-key evil-normal-state-local-map (kbd "o") 'neotree-enter)
                         (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter))))

(provide 'init-evil)
