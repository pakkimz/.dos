(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(evil-mode 1)
(global-set-key [f2] 'neotree-toggle)

(global-auto-complete-mode t)
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)
(define-key ac-complete-mode-map "\C-j" 'ac-next)
(define-key ac-complete-mode-map "\C-k" 'ac-previous)
(define-key ac-complete-mode-map "\C-y" 'ac-complete)
(define-key ac-complete-mode-map "\t" 'ac-complete)
(define-key ac-complete-mode-map "\C-e" nil)

(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js2-mode-hook
					(lambda ()
						(tern-mode t)))
(eval-after-load 'tern
								 '(progn
										(require 'tern-auto-complete)
										(tern-ac-setup)))
;; Turn off js2 mode errors & warnings (we lean on eslint/standard)
(setq js2-mode-show-parse-errors nil)
(setq js2-mode-show-strict-warnings nil)
;; Use eslint to check syntax
(add-hook 'js2-mode-hook
					(defun my-js2-mode-setup ()
						(flycheck-mode t)
						(when (executable-find "eslint")
							(flycheck-select-checker 'javascript-eslint))))

;; Transparency
(set-frame-parameter (selected-frame) 'alpha '(95 95))
(add-to-list 'default-frame-alist '(alpha 95 95))

(setq visible-bell 1)
(tool-bar-mode -1)
(blink-cursor-mode 0)
(add-to-list 'default-frame-alist '(vertical-scroll-bars . nil))

(set-frame-font "Hack NF" nil t)
(electric-pair-mode 1)
(global-display-line-numbers-mode)

;; backup and autosave directories
(setq temporary-file-directory "~/.emacs.d/.tmp/")
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; indentation
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

;; map single control to ESC
(with-eval-after-load 'evil-maps
                      (define-key evil-insert-state-map (kbd "C-SPC") 'evil-force-normal-state)
                      (define-key evil-normal-state-map (kbd "C-SPC") 'evil-ex-nohighlight)
                      (define-key evil-visual-state-map (kbd "C-SPC") 'evil-force-normal-state)
                      (define-key evil-ex-completion-map (kbd "C-SPC") (kbd "C-c")))

; (load-theme 'modus-operandit t)            ; Light theme
(load-theme 'modus-vivendi t)             ; Dark theme
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
	 '(neotree tern-auto-complete php-mode modus-themes js2-mode flycheck evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
