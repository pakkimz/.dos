(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Set HOME as default directory
(setq default-directory "~/")

;; Move to trash when delete
(setq delete-by-moving-to-trash t)

;; Transparency
(set-frame-parameter (selected-frame) 'alpha '(95 95))
(add-to-list 'default-frame-alist '(alpha 95 95))

;; Change title
(setq-default frame-title-format '("%f"))
; (setq-default mode-line-format nil) ;; disable modeline

(show-paren-mode t)                   ;; highlight match pair
(global-display-line-numbers-mode)    ;; display number
(global-visual-line-mode t)           ;; line wrap

;; Indentation
(setq js-indent-level 2)
(setq-default c-basic-offset 2)
(setq c-basic-offset 2)
(setq-default tab-width 2)
(setq-default c-basic-indent 2)
(setq-default indent-tabs-mode nil)   ;; expandtab

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

;; Smooth scrolling
(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)

;; Removes trailing whitespace when save
(add-hook 'write-file-hooks 'delete-trailing-whitespace)

;; No more typing the whole yes or no. Just y or n will do.
(fset 'yes-or-no-p 'y-or-n-p)

;; Forces the messages to 0, and kills the *Messages* buffer - thus disabling it on startup.
(setq-default message-log-max nil)
(kill-buffer "*Messages*")

;; Disable backup and autosave directories
(setq auto-save-default nil)
(setq make-backup-files nil)
(setq create-lockfiles nil)
;; Enable backup and autosave directories
; (setq backup-by-copying t)
; (setq temporary-file-directory "~/.emacs.d/.tmp/")
; (setq backup-directory-alist `((".*" . ,temporary-file-directory)))
; (setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; Ivy
(ivy-mode)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)

;; Auto close pair
(electric-pair-mode 1)
;; Don't auto-indent
; (when (fboundp 'electric-indent-mode) (electric-indent-mode -1))
;; Auto close single-quote, backtic and comment
(push '(?\' . ?\') electric-pair-pairs)
(push '(?\' . ?\') electric-pair-text-pairs)
(push '(?\` . ?\`) electric-pair-pairs)
(push '(?\` . ?\`) electric-pair-text-pairs)
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
(setq ac-auto-show-menu 0.0)    ;; don't delay
(setq ac-use-quick-help nil)    ;; disable tooltip
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)
(define-key ac-complete-mode-map "\C-y" 'ac-complete)
(define-key ac-complete-mode-map "\t" 'ac-complete)
(define-key ac-complete-mode-map "\r" nil)
(define-key ac-complete-mode-map "\C-e" 'ac-stop)

;; Web mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ejs$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-enable-auto-closing t)

;; Disable tern argument
(setq-default tern-update-argument-hints-async t)
;; Tern autocompletion
(add-hook 'web-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
                 '(progn
                    (require 'tern-auto-complete)
                    (tern-ac-setup)))

;; Flycheck active after command M-x flycheck-mode / global-flycheck-mode
(require 'flycheck)
(setq-default flycheck-temp-prefix ".flycheck")
(setq flymake-no-changes-timeout nil)
(setq flymake-start-syntax-check-on-newline nil)
(setq flycheck-check-syntax-automatically '(save mode-enabled))
(flycheck-add-mode 'javascript-eslint 'web-mode)      ;; use eslint with web-mode
; (add-hook 'after-init-hook #'global-flycheck-mode)  ;; turn on globally

;; Omnicomplete for html and css
; (require 'auto-complete-config)
; (add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20201213.1255/dict/")
; (ac-config-default)
; (add-to-list 'ac-modes 'web-mode)
; (setq web-mode-ac-sources-alist
;   '(("css"  . (ac-source-css-property))
;     ("html" . (ac-source-words-in-buffer ac-source-abbrev))))

;; Switch between split with meta and arrow
(windmove-default-keybindings 'meta)

;; Switch between buffer
(global-set-key [(control l)] 'next-buffer)
(global-set-key [(control h)] 'previous-buffer)

;; Move line up and down
(defun move-line-up ()
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))
(defun move-line-down ()
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))
(global-set-key [(control shift up)]  'move-line-up)
(global-set-key [(control shift down)]  'move-line-down)

;; Close all buffer except this buffer
(defun only-current-buffer ()
  (interactive)
  (mapc 'kill-buffer (cdr (buffer-list (current-buffer)))))

;; C-u for scroll up in normal mode
(setq evil-want-C-u-scroll t)

;; Evil stuff
(evil-mode 1)
(evil-commentary-mode)
(global-evil-surround-mode 1)

;; Set leader key in normal state
(evil-set-leader 'normal (kbd "SPC"))

;; Use undo-fu for system undo
(setq evil-undo-system 'undo-fu)

;; Recent file or mru
(recentf-mode 1)
(setq recentf-max-menu-items 25)

;; C-u to delete line before cursor
(define-key evil-insert-state-map (kbd "C-u")
            (lambda ()
              (interactive)
              (if (looking-back "^" 0)
                (backward-delete-char 1)
                (if (looking-back "^\s*" 0)
                  (delete-region (point) (line-beginning-position))
                  (evil-delete (+ (line-beginning-position) (current-indentation)) (point))))))

;; Map single control to ESC
(with-eval-after-load 'evil-maps
                      (define-key evil-normal-state-map (kbd "g .") 'goto-last-change)
                      (define-key evil-normal-state-map (kbd "<leader>O") 'only-current-buffer)
                      (define-key evil-normal-state-map (kbd "<leader>m") 'counsel-recentf)
                      (define-key evil-normal-state-map (kbd "<leader>b") 'ivy-switch-buffer)
                      (define-key evil-normal-state-map (kbd "<leader>w") 'save-buffer)
                      (define-key evil-normal-state-map (kbd "<leader>r") 'kill-this-buffer)
                      (define-key evil-normal-state-map (kbd "<leader>q") 'save-buffers-kill-terminal)
                      (define-key evil-insert-state-map (kbd "C-SPC") 'evil-force-normal-state)
                      (define-key evil-normal-state-map (kbd "C-SPC") 'evil-ex-nohighlight)
                      (define-key evil-visual-state-map (kbd "C-SPC") 'evil-force-normal-state)
                      (define-key evil-ex-completion-map (kbd "C-SPC") (kbd "C-c"))
                      (define-key evil-insert-state-map "\C-a" 'beginning-of-line)
                      (define-key evil-insert-state-map "\C-e" 'end-of-line)
                      (define-key evil-insert-state-map (kbd "TAB") 'tab-to-tab-stop)
                      (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
                      (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
                      (define-key evil-normal-state-map "u" 'undo-fu-only-undo)
                      (define-key evil-normal-state-map "\C-r" 'undo-fu-only-redo))

;; Neotree cd directory function
(defun my-neotree-project-dir-toggle ()
  "Open NeoTree using the project root, using projectile, find-file-in-project,
  or the current buffer directory."
  (interactive)
  (require 'neotree)
  (let* ((filepath (buffer-file-name))
         (project-dir
           (with-demoted-errors
             (cond
               ((featurep 'projectile)
                (projectile-project-root))
               ((featurep 'find-file-in-project)
                (ffip-project-root))
               (t ;; Fall back to version control root.
                 (if filepath
                   (vc-call-backend
                     (vc-responsible-backend filepath) 'root filepath)
                   nil)))))
         (neo-smart-open t))

    (if (and (fboundp 'neo-global--window-exists-p)
             (neo-global--window-exists-p))
      (neotree-hide)
      (neotree-show)
      (when project-dir
        (neotree-dir project-dir))
      (when filepath
        (neotree-find filepath)))))

(setq neo-theme 'icon)
(global-set-key [f1] 'neotree-toggle)
(global-set-key [f2] 'my-neotree-project-dir-toggle)
; (setq neo-theme 'nerd)
(setq-default neo-show-hidden-files t)
;; Disable line-numbers minor mode for neotree
(add-hook 'neo-after-create-hook
          (lambda (&rest _) (display-line-numbers-mode -1)))
;; Neotree maps
(add-hook 'neotree-mode-hook
          (lambda ()
            (define-key evil-normal-state-local-map (kbd "s") 'neotree-enter-vertical-split)
            (define-key evil-normal-state-local-map (kbd "i") 'neotree-enter-horizontal-split)
            (define-key evil-normal-state-local-map (kbd "o") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

(load-theme 'jbeans t)
(set-frame-font "Hack NF" nil t)
(set-face-attribute 'default nil :height 101)
