(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; Transparency
(set-frame-parameter (selected-frame) 'alpha '(95 95))
(add-to-list 'default-frame-alist '(alpha 95 95))

(require 'evil)
(evil-mode 1)

(setq visible-bell 1)
(tool-bar-mode -1)
(blink-cursor-mode 0)
(add-to-list 'default-frame-alist '(vertical-scroll-bars . nil))

(set-frame-font "Hack NF" nil t)
(electric-pair-mode 1)
(global-display-line-numbers-mode)

(setq js-indent-level 2)
(setq-default c-basic-offset 2)
(setq c-basic-offset 2)
(setq-default tab-width 2)
(setq-default c-basic-indent 2)
(autoload 'php-mode "php-mode.el" "Php mode." t)
(add-to-list 'auto-mode-alist '("\\.php[345]?$" . php-mode))
(add-hook 'php-mode-hook #'(lambda() (setq c-basic-offset 2)))

;; set leader key in normal state
(evil-set-leader 'normal (kbd "SPC"))
(evil-define-key 'normal 'global (kbd "<leader>w") 'save-buffer)
(evil-define-key 'normal 'global (kbd "<leader>r") (kbd "C-x K RET"))
(evil-define-key 'normal 'global (kbd "<leader>q") (kbd "C-x C-c"))
(global-set-key (kbd "C-l") 'next-buffer)
(global-set-key (kbd "C-h") 'previous-buffer)

;; Map single control to ESC
(with-eval-after-load 'evil-maps
                      (define-key evil-insert-state-map (kbd "C-SPC") 'evil-force-normal-state)
                      (define-key evil-normal-state-map (kbd "C-SPC") 'evil-ex-nohighlight)
                      (define-key evil-visual-state-map (kbd "C-SPC") 'evil-force-normal-state)
                      (define-key evil-ex-completion-map (kbd "C-SPC") (kbd "C-c")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
	 '("0568a5426239e65aab5e7c48fa1abde81130a87ddf7f942613bf5e13bf79686b" default))
 '(package-selected-packages '(php-mode smartparens modus-themes evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
; (load-theme 'modus-operandi)            ; Light theme
(load-theme 'modus-vivendi)             ; Dark theme
