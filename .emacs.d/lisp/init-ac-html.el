;; Better completion for html-mode
(defun setup-ac-for-html ()
  ;; Require ac-html since we are setup html auto completion
  (require 'ac-html)
  ;; Require default data provider if you want to use
  (require 'ac-html-default-data-provider)
  ;; Enable data providers,
  ;; currently only default data provider available
  (ac-html-enable-data-provider 'ac-html-default-data-provider)
  ;; Let ac-html do some setup
  (ac-html-setup)
  ;; Set your ac-source
  (setq ac-sources '(ac-source-html-tag
                      ac-source-html-attr
                      ac-source-html-attrv))
  ;; Enable auto complete mode
  (auto-complete-mode))

(use-package ac-html
             :init
             (add-hook 'html-mode-hook 'setup-ac-for-html))

(provide 'init-ac-html)
