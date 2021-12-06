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
; (defun remove-electric-indent-mode ()
;   (electric-indent-local-mode -1))
; (add-hook 'html-mode-hook 'remove-electric-indent-mode)

(provide 'init-electric)
