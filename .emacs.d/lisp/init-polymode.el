(use-package polymode
             :init
             ;; set mode for html files
             (add-to-list 'auto-mode-alist '("\\.html\\'" . poly-html-mode))
             (add-to-list 'auto-mode-alist '("\\.php\\'" . poly-php-mode))

             :config
             ;; html host with js and css innermodes
             (define-hostmode poly-html-hostmode
                              :mode 'html-mode)
             (define-innermode poly-html-js-metadata-innermode
                               :mode 'js2-mode
                               :head-matcher "^[ \t]*<script.*>"
                               :tail-matcher "^[ \t]*</script.*>"
                               :head-mode 'host
                               :tail-mode 'host
                               :body-indent-offset '2
                               )
             (define-innermode poly-html-css-metadata-innermode
                               :mode 'css-mode
                               :head-matcher "^[ \t]*<style.*>"
                               :tail-matcher "^[ \t]*</style.*>"
                               :head-mode 'host
                               :tail-mode 'host
                               :body-indent-offset '2
                               )
             (define-polymode poly-html-mode
                              :hostmode 'poly-html-hostmode
                              :innermodes '(poly-html-js-metadata-innermode
                                             poly-html-css-metadata-innermode)
                              )

             ;; php host with html, css and js innermodes
             (define-hostmode poly-php-hostmode
                              :mode 'php-mode)
             (define-innermode poly-php-html-metadata-innermode
                               :mode 'html-mode
                               :head-matcher "^[ \t]*<html.*>"
                               :tail-matcher "^[ \t]*</html.*>"
                               :head-mode 'host
                               :tail-mode 'host
                               :body-indent-offset '2
                               )
             (define-polymode poly-php-mode
                              :hostmode 'poly-php-hostmode
                              :innermodes '(poly-php-html-metadata-innermode)
                              )
             )

(provide 'init-polymode)
