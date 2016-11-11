;;; core-flycheck.el --- check yourself before you shrek yourself

(use-package pkg-info)

(use-package flycheck
  :commands (flycheck-mode flycheck-list-errors flycheck-buffer)
  :init
  (setq flycheck-indication-mode 'right-fringe
        ;; Removed checks on idle/change for snappiness
        flycheck-check-syntax-automatically '(save mode-enabled)
        flycheck-highlighting-mode 'symbols
        flycheck-disabled-checkers '(emacs-lisp emacs-lisp-checkdoc make)
        ;; `flycheck-pos-tip'
        flycheck-pos-tip-timeout 10
        flycheck-display-errors-delay 0.5)

  :config
  (def-popup! " ?\\*Flycheck.+\\*" :align below :size 14 :noselect t :regexp t)

  (define-fringe-bitmap 'flycheck-fringe-bitmap-double-arrow
    [0 0 0 0 0 4 12 28 60 124 252 124 60 28 12 4 0 0 0 0]))

(use-package flyspell :commands flyspell-mode)

(provide 'core-flycheck)
;;; core-flycheck.el ends here
