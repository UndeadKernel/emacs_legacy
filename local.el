;;------------- Use Windows Line Endings ---------------
;(setq default-buffer-file-coding-system 'dos)
  
  
;;---------------- Programming Styles ------------------

;; Javascript customizations ---------------------------
(add-hook 'js-mode-hook
    (function (lambda ()
        (setq js-indent-level 2))))

; Python customization ---------------------------------
(add-hook 'python-mode-hook
    (function (lambda ()
        (setq indent-tabs-mode nil
            tab-width 4))))

;; C customization -------------------------------------
(add-hook 'c-mode-hook
    (function (lambda ()
        (setq tab-width 4)
            (setq c-basic-offset tab-width)
            (setq c-indent-level tab-width)
            (setq indent-tabs-mode nil)
        )
    )
)

;; C++ customization -----------------------------------
(add-hook 'c++-mode-hook
  (function (lambda ()
        (setq default-tab-width 4)
        (setq tab-width 4)
        (setq c-basic-offset tab-width)
        (setq c-indent-level tab-width)
        (setq indent-tabs-mode nil)
        ;; Indentation Style
        (c-set-offset 'access-label '/)
        (c-set-offset 'case-label '*)
        (c-set-offset 'arglist-intro '++)
        (c-set-offset 'substatement-open 0)
        (c-set-offset 'arglist-cont-nonempty '+)
        (c-set-offset 'arglist-intro '+)
        (c-set-offset 'statement-case-intro '*)
        (c-set-offset 'brace-list-open 0)
        )
    )
)

;; Ruby customizations -----------------------------------
(setq ruby-indent-level 4)