;; ----------------------------------------------------------------------------------
;; General
;; ----------------------------------------------------------------------------------
;; Set default font
; (set-face-attribute 'default nil
;                     :family "Hack"
;                     :height 101
;                     :weight 'bold
;                     :width 'normal)

(add-to-list 'default-frame-alist '(font . "Hack NF-10.1"))

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

(show-paren-mode t)                             ;; highlight match pair
(global-display-line-numbers-mode)              ;; display number
(diminish 'global-visual-line-mode t)           ;; line wrap
(diminish 'eldoc-mode)

(setq-default tab-width 2)            ;; tab width
(setq-default indent-tabs-mode nil)   ;; expandtab
(setq c-basic-offset 2)
(setq sh-basic-offset 2)
(setq js-indent-level 2)
(setq css-indent-offset 2)

(setq python-indent-guess-indent-offset nil)
(setq python-indent-offset 2)

;; php indent
(add-hook 'php-mode-hook
          (lambda ()
            (make-local-variable 'c-basic-offset)
            (setq c-basic-offset 2)))

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
(setq frame-inhibit-implied-resize t)             ;; add 0.4-1s to startup
(setq initial-major-mode 'fundamental-mode)

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

;; Backspace remove according to tab size & C-SPC to quit everthing
(global-set-key [backspace] 'backspace-whitespace-to-tab-stop)
(global-set-key (kbd "C-SPC") 'keyboard-escape-quit)

;; Removes trailing whitespace when save
(add-hook 'write-file-hooks 'delete-trailing-whitespace)

;; No more typing the whole yes or no. Just y or n will do.
(fset 'yes-or-no-p 'y-or-n-p)

;; Forces the messages to 0, and kills the *Messages* buffer - thus disabling it on startup.
(setq-default message-log-max nil)
(kill-buffer "*Messages*")

;; Treat underscore and minus part of word
(modify-syntax-entry ?_ "w")
(modify-syntax-entry ?- "w")

(provide 'init-general)
