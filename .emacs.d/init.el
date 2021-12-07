;; Install straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Install use-package
(straight-use-package 'use-package)

;; Configure use-package to use straight.el by default
(use-package straight
             :custom (straight-use-package-by-default t))

(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'init-general)
(require 'init-evil)
(require 'init-functions)
(require 'init-electric)
(require 'init-auto-complete)
; (require 'init-ivy)
(require 'init-vertico)
(require 'init-org-bullets)
(require 'init-jbeans-theme)
; (require 'init-js2-mode)
(require 'init-flycheck)
(require 'init-tern)
(require 'init-ac-html)
; (require 'init-web-mode)
; (require 'init-polymode)
