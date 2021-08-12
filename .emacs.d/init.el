(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(setq visible-bell 1)
(tool-bar-mode -1)
(blink-cursor-mode 0)
(add-to-list 'default-frame-alist
             '(vertical-scroll-bars . nil))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(custom-safe-themes
   '("0568a5426239e65aab5e7c48fa1abde81130a87ddf7f942613bf5e13bf79686b" "b0334e8e314ea69f745eabbb5c1817a173f5e9715493d63b592a8dc9c19a4de6" default))
 '(package-selected-packages '(key-chord modus-themes soothe-theme ##))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Hack NF" :foundry "outline" :slant normal :weight bold :height 98 :width normal)))))

;; Transparency
(set-frame-parameter (selected-frame) 'alpha '(95 95))
(add-to-list 'default-frame-alist '(alpha 95 95))

(require 'evil)
(evil-mode 1)

;; Map single control to ESC
  (with-eval-after-load 'evil-maps
    (define-key evil-insert-state-map (kbd "C-SPC") 'evil-force-normal-state)
    (define-key evil-normal-state-map (kbd "C-SPC") 'evil-ex-nohighlight)
    (define-key evil-visual-state-map (kbd "C-SPC") 'evil-force-normal-state)
    (define-key evil-ex-completion-map (kbd "C-SPC") (kbd "C-c"))
    )

; (load-theme 'modus-operandi)            ; Light theme
(load-theme 'modus-vivendi)             ; Dark theme
