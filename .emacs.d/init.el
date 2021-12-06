;; ----------------------------------------------------------------------------------
;; General
;; ----------------------------------------------------------------------------------
;; Set default font
(set-face-attribute 'default nil
                    :family "Hack"
                    :height 101
                    :weight 'bold
                    :width 'normal)

;; Increase garbage collector threshold to speed up startup
(setq gc-cons-threshold 10000000)
;; Restore after startup
(add-hook 'after-init-hook
          (lambda ()
            (setq gc-cons-threshold 1000000)
            (message "gc-cons-threshold restored to %S"
                     gc-cons-threshold)))

;; This stops emacs adding customised settings to init.el
(setq custom-file (make-temp-file "emacs-custom"))

;; Transparency
(set-frame-parameter (selected-frame) 'alpha '(95 95))
(add-to-list 'default-frame-alist '(alpha 95 95))

(setq default-directory "~/")                   ;; set HOME as default
(setq delete-by-moving-to-trash t)              ;; move to trash
(setq-default frame-title-format '("%f"))       ;; title
; (setq-default mode-line-format nil)           ;; disable modeline

(show-paren-mode t)                   ;; highlight match pair
(global-display-line-numbers-mode)    ;; display number
(global-visual-line-mode t)           ;; line wrap

(setq-default tab-width 2)            ;; tab width
(setq-default indent-tabs-mode nil)   ;; expandtab
(setq c-basic-offset 2)
(setq sh-basic-offset 2)
(setq js-indent-level 2)
(setq css-indent-offset 2)

(blink-cursor-mode 0)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode nil)

(setq visible-bell 1)
(setq show-help-function nil)
(setq initial-scratch-message nil)
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq inhibit-startup-screen t)

;; Smooth scrolling
(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)

;; Disable backup and autosave directories
(setq auto-save-default nil)
(setq make-backup-files nil)
(setq create-lockfiles nil)
;; Enable backup and autosave directories
; (setq backup-by-copying t)
; (setq temporary-file-directory "~/.emacs.d/.tmp/")
; (setq backup-directory-alist `((".*" . ,temporary-file-directory)))
; (setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; Backspace remove according to tab size
(global-set-key [backspace] 'backspace-whitespace-to-tab-stop)

;; Removes trailing whitespace when save
(add-hook 'write-file-hooks 'delete-trailing-whitespace)

;; No more typing the whole yes or no. Just y or n will do.
(fset 'yes-or-no-p 'y-or-n-p)

;; Forces the messages to 0, and kills the *Messages* buffer - thus disabling it on startup.
(setq-default message-log-max nil)
(kill-buffer "*Messages*")
;; ----------------------------------------------------------------------------------
;; Packages
;; ----------------------------------------------------------------------------------
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(setq use-package-always-ensure t)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))

;; Auto close pair
(use-package electric
             :init
             (electric-pair-mode 1)
             :config
             ;; Disable auto-indent
             ; (when (fboundp 'electric-indent-mode) (electric-indent-mode -1))
             ;; Auto close single-quote and backtic
             (push '(?\' . ?\') electric-pair-pairs)
             (push '(?\` . ?\`) electric-pair-pairs)
             ; (push '(?\' . ?\') electric-pair-text-pairs)    ;; in comment and text
             ; (push '(?\` . ?\`) electric-pair-text-pairs)
             ;; Disable pair in <
             (setq electric-pair-inhibit-predicate
                   `(lambda (c)
                      (if (char-equal c ?\<) t (,electric-pair-inhibit-predicate c)))))
;; Disable electric indent on html
(defun remove-electric-indent-mode ()
  (electric-indent-local-mode -1))
(add-hook 'html-mode-hook 'remove-electric-indent-mode)

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

;; Recent file or mru
(use-package recentf
             :config
             (recentf-mode 1)
             (setq recentf-max-menu-items 25))

;; Ivy
(use-package counsel)
(use-package ivy
             :diminish (ivy-mode . "")
             :init (ivy-mode 1) ; globally at startup
             :config
             (setq ivy-use-virtual-buffers t)
             (setq enable-recursive-minibuffers t)
             (setq ivy-count-format "%d/%d "))
(provide 'init-ivy)
(with-eval-after-load 'ivy
                      (global-set-key "\C-s" 'swiper)
                      (global-set-key (kbd "C-x C-f") 'counsel-find-file)
                      (global-set-key (kbd "C-x C-b") 'ivy-switch-buffer)
                      (global-set-key (kbd "C-x C-m") 'counsel-recentf)
                      (global-set-key (kbd "\C-w") 'counsel-up-directory))

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

(use-package evil-collection
             :after evil
             (setq evil-want-integration t)
             (evil-collection-init))

(use-package evil-commentary
             :after evil
             :config
             (evil-commentary-mode))

(use-package evil-surround
             :after evil
             :config
             (global-evil-surround-mode 1))

(add-to-list 'load-path "~/.emacs.d/lisp/evil-unimpaired/")
(require 'evil-unimpaired)
(evil-unimpaired-mode)

(with-eval-after-load 'evil-maps
                      (define-key evil-normal-state-map "Y" 'djoyner/copy-to-end-of-line)
                      (define-key evil-visual-state-map (kbd ">") 'djoyner/evil-shift-right-visual)
                      (define-key evil-visual-state-map (kbd "<") 'djoyner/evil-shift-left-visual)
                      (define-key evil-insert-state-map (kbd "\C-h") 'delete-backward-char)
                      (define-key evil-normal-state-map "\C-j" 'move-line-down)
                      (define-key evil-normal-state-map "\C-k" 'move-line-up)
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
                      (define-key evil-ex-completion-map (kbd "C-SPC") (kbd "C-c"))
                      (define-key evil-insert-state-map "\C-a" 'beginning-of-line)
                      (define-key evil-insert-state-map "\C-e" 'end-of-line)
                      (define-key evil-insert-state-map (kbd "TAB") 'tab-to-tab-stop)
                      (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
                      (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
                      (define-key evil-normal-state-map "u" 'undo-fu-only-undo)
                      (define-key evil-normal-state-map "\C-r" 'undo-fu-only-redo))

(use-package neotree
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

;; Org mode
(use-package org-bullets
             :config
             ; (setq org-adapt-indentation nil)                ;; disable indent
             (setq org-bullets-bullet-list '("•" "➤" "•"))
             (global-set-key "\C-ca" 'org-agenda)
             :init
             (add-hook 'org-mode-hook 'org-bullets-mode 1))

(use-package jbeans-theme
             :config
             (load-theme 'jbeans t))
;; ----------------------------------------------------------------------------------
;; Programming
;; ----------------------------------------------------------------------------------
;; Web mode
(use-package web-mode
             :mode
             (("\\.css\\'" . web-mode)
              ("\\.html?\\'" . web-mode)
              ("\\.php\\'" . web-mode))
             :config
             (setq web-mode-markup-indent-offset 2)
             (setq web-mode-css-indent-offset 2)
             (setq web-mode-code-indent-offset 2)
             (setq web-mode-enable-auto-closing t)
             (setq web-mode-ac-sources-alist
                   '(("css" . (ac-source-words-in-buffer ac-source-css-property))
                     ("html" . (ac-source-words-in-buffer ac-source-abbrev))
                     ("php" . (ac-source-words-in-buffer
                                ac-source-words-in-same-mode-buffers
                                ac-source-dictionary))))
             (setq web-mode-engines-alist
                   '(("php"    . "\\.html\\'")
                     ("blade"  . "\\.blade\\."))))

(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20201213.1255/dict/")
(ac-config-default)

;; Js2 mode
(use-package js2-mode
             :init
             (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
             ;; Better imenu
             (add-hook 'js2-mode-hook #'js2-imenu-extras-mode)
             :config
             ;; Disable syntax checker js2-mode
             (setq js2-mode-show-parse-errors nil)
             (setq js2-mode-show-strict-warnings nil))

;; Flycheck active after command M-x flycheck-mode / global-flycheck-mode
(use-package flycheck
             :init
             ; (add-hook 'after-init-hook #'global-flycheck-mode)  ;; auto turn on globally
             :config
             (setq-default flycheck-temp-prefix ".flycheck")
             (setq flymake-no-changes-timeout nil)
             (setq flymake-start-syntax-check-on-newline nil)
             (setq flycheck-check-syntax-automatically '(save mode-enabled)))
(flycheck-add-mode 'javascript-eslint 'web-mode)     ;; use eslint with web-mode
(flycheck-add-mode 'javascript-eslint 'js2-mode)     ;; use eslint with web-mode

;; Tern javascript completion
(use-package tern
             :init
             ;; Set web-mode & js2 to tern-mode
             ; (add-hook 'web-mode-hook (lambda () (tern-mode t)))
             (add-hook 'js2-mode-hook (lambda () (tern-mode t)))
             :config
             ;; Disable tern argument
             (setq-default tern-update-argument-hints-async t))
(use-package tern-auto-complete)
(eval-after-load 'tern
                 '(progn
                    (require 'tern-auto-complete)
                    (tern-ac-setup)))
;; ----------------------------------------------------------------------------------
;; Functions
;; ----------------------------------------------------------------------------------
;; Close all buffer except this buffer
(defun only-current-buffer ()
  (interactive)
  (mapc 'kill-buffer (cdr (buffer-list (current-buffer)))))

;; Copy to the end of line
(defun djoyner/copy-to-end-of-line ()
  (interactive)
  (copy-region-as-kill (point) (point-at-eol)))

;; C-u to delete line before cursor
(define-key evil-insert-state-map (kbd "C-u")
            (lambda ()
              (interactive)
              (if (looking-back "^" 0)
                (backward-delete-char 1)
                (if (looking-back "^\s*" 0)
                  (delete-region (point) (line-beginning-position))
                  (evil-delete (+ (line-beginning-position) (current-indentation)) (point))))))

;; Overload shifts so that they don't lose the selection
(defun djoyner/evil-shift-left-visual ()
  (interactive)
  (evil-shift-left (region-beginning) (region-end))
  (evil-normal-state)
  (evil-visual-restore))
(defun djoyner/evil-shift-right-visual ()
  (interactive)
  (evil-shift-right (region-beginning) (region-end))
  (evil-normal-state)
  (evil-visual-restore))

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

;; Backspace remove as one ta when there is no character
(defvar my-offset 2 "My indentation offset. ")
(defun backspace-whitespace-to-tab-stop ()
  "Delete whitespace backwards to the next tab-stop, otherwise delete one character."
  (interactive)
  (if (or indent-tabs-mode
          (region-active-p)
          (save-excursion
            (> (point) (progn (back-to-indentation)
                              (point)))))
    (call-interactively 'backward-delete-char-untabify)
    (let ((movement (% (current-column) my-offset))
          (p (point)))
      (when (= movement 0) (setq movement my-offset))
      ;; Account for edge case near beginning of buffer
      (setq movement (min (- p 1) movement))
      (save-match-data
        (if (string-match "[^\t ]*\\([\t ]+\\)$" (buffer-substring-no-properties (- p movement) p))
          (backward-delete-char (- (match-end 1) (match-beginning 1)))
          (call-interactively 'backward-delete-char))))))

;; Rename file and buffer
;; source: http://steve.yegge.googlepages.com/my-dot-emacs-file
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
      (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
        (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))

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
;; ----------------------------------------------------------------------------------
