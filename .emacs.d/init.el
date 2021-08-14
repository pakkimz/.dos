(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(evil-mode 1)
(evil-commentary-mode)
(global-evil-surround-mode 1)

;; Transparency
(set-frame-parameter (selected-frame) 'alpha '(95 95))
(add-to-list 'default-frame-alist '(alpha 95 95))

(setq-default frame-title-format '("%f"))
; (setq-default mode-line-format nil)

(set-frame-font "Hack NF" nil t)
(global-display-line-numbers-mode)
(global-visual-line-mode t)

;; Indentation
(setq js-indent-level 2)
(setq-default c-basic-offset 2)
(setq c-basic-offset 2)
(setq-default tab-width 2)
(setq-default c-basic-indent 2)

(blink-cursor-mode 0)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode nil)
(setq show-help-function nil)

(setq initial-scratch-message nil)
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq inhibit-startup-screen t)
(setq visible-bell 1)

;; Removes trailing whitespace when save
(add-hook 'write-file-hooks 'delete-trailing-whitespace)

;; Forces the messages to 0, and kills the *Messages* buffer - thus disabling it on startup.
(setq-default message-log-max nil)
(kill-buffer "*Messages*")

;; Removes *scratch* from buffer after the mode has been set.
(defun remove-scratch-buffer ()
  (if (get-buffer "*scratch*")
      (kill-buffer "*scratch*")))
(add-hook 'after-change-major-mode-hook 'remove-scratch-buffer)

;; Backup and autosave directories
(setq backup-by-copying t)
(setq temporary-file-directory "~/.emacs.d/.tmp/")
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; Auto close pair
(electric-pair-mode 1)
; (when (fboundp 'electric-indent-mode) (electric-indent-mode -1))
;; Disable pair in <
(setq electric-pair-inhibit-predicate
      `(lambda (c)
         (if (char-equal c ?\<) t (,electric-pair-inhibit-predicate c))))
;; Disable indent on html
(defun remove-electric-indent-mode ()
  (electric-indent-local-mode -1))
(add-hook 'html-mode-hook 'remove-electric-indent-mode)

;; Autocompletion
(global-auto-complete-mode t)
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)
(define-key ac-complete-mode-map "\C-j" 'ac-next)
(define-key ac-complete-mode-map "\C-k" 'ac-previous)
(define-key ac-complete-mode-map "\C-y" 'ac-complete)
(define-key ac-complete-mode-map "\t" 'ac-complete)
(define-key ac-complete-mode-map "\C-e" 'ac-stop)

;; Tern js
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
; (add-hook 'js2-mode-hook
; 					(defun my-js2-mode-setup ()
; 						(flycheck-mode t)
; 						(when (executable-find "eslint")
; 							(flycheck-select-checker 'javascript-eslint))))

;; Web mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ejs$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))

(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-enable-auto-closing t)

;; Omnicomplete for html and css
; (require 'auto-complete-config)
; (add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20201213.1255/dict/")
; (ac-config-default)
; (add-to-list 'ac-modes 'web-mode)
; (setq web-mode-ac-sources-alist
;   '(("css"  . (ac-source-css-property))
;     ("html" . (ac-source-words-in-buffer ac-source-abbrev))))

;; Set leader key in normal state
(evil-set-leader 'normal (kbd "SPC"))
(evil-define-key 'normal 'global (kbd "<leader>b") 'ibuffer)
(evil-define-key 'normal 'global (kbd "<leader>w") 'save-buffer)
(evil-define-key 'normal 'global (kbd "<leader>r") (kbd "C-x K RET"))
(evil-define-key 'normal 'global (kbd "<leader>q") (kbd "C-x C-c"))

;; Recent file or mru
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(evil-define-key 'normal 'global (kbd "<leader>m") 'recentf-open-files)

(global-set-key (kbd "C-l") 'next-buffer)
(global-set-key (kbd "C-h") 'previous-buffer)

;; Map single control to ESC
(with-eval-after-load 'evil-maps
                      (define-key evil-insert-state-map (kbd "C-SPC") 'evil-force-normal-state)
                      (define-key evil-normal-state-map (kbd "C-SPC") 'evil-ex-nohighlight)
                      (define-key evil-visual-state-map (kbd "C-SPC") 'evil-force-normal-state)
                      (define-key evil-ex-completion-map (kbd "C-SPC") (kbd "C-c"))
                      (define-key evil-insert-state-map "\C-a" 'beginning-of-line)
                      (define-key evil-insert-state-map "\C-e" 'end-of-line)
                      (define-key evil-insert-state-map (kbd "TAB") 'tab-to-tab-stop)
                      (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
                      (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line))

(global-set-key [f2] 'neotree-toggle)
(add-hook 'neotree-mode-hook
      (lambda ()
        (define-key evil-normal-state-local-map (kbd "s") 'neotree-enter-vertical-split)
        (define-key evil-normal-state-local-map (kbd "i") 'neotree-enter-horizontal-split)
        (define-key evil-normal-state-local-map (kbd "O") 'neotree-enter)
        (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

(load-theme 'jbeans t)
