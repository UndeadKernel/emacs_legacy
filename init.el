;--------------------------------------------------------------------
; .emacs by Carlos García Cordero                                   ;
;--------------------------------------------------------------------

;;--------------------- Global Config -------------------------------
; Set the 'gui-window-system' to 't' or 'nil'.
(setq gui-window-system (if window-system t 'nil))


;;------------------ General Configuration Options ------------------
(load-file "~/.emacs.d/conf.el")

;;------------------------- My Functions ----------------------------
(load-file "~/.emacs.d/functions.el")

;;--------------------------- Key Bindings --------------------------
(load-file "~/.emacs.d/binds.el")

;;------------------------- File Extensions -------------------------
(load-file "~/.emacs.d/extensions.el")

;;-------------------------- How Emacs Looks ------------------------
;(load "looks")
(load-file "~/.emacs.d/appearance.el")

;;---------------------------- Plugins ------------------------------
(load-file "~/.emacs.d/plugins.el")

;;----------------------- Mode Configuration ------------------------
(load-file "~/.emacs.d/modes.el")

;;--------------------- Local Customizations ------------------------
(load-file "~/.emacs.d/local.el")


;;--------------------- Custom Emacs Config -------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("461d4bbbf89b292b170d72f7c9da35c39a0c22a7bdf9c20ed6948ad42559b100" "afe63f57e7b8bbc0402093e0812dc98c6a6578764b868b27834a5dacef377238" default)))
 '(doc-view-ghostscript-options
   (quote
    ("-dSAFER" "-dNOPAUSE" "-sDEVICE=png16m" "-dTextAlphaBits=4" "-dBATCH" "-dGraphicsAlphaBits=4" "-dQUIET" "-r460")))
 '(doc-view-resolution 300)
 '(wg-mode-line-decor-left-brace "[")
 '(wg-mode-line-decor-right-brace "]")
 '(wg-mode-line-use-faces t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-hide ((((background light)) (:foreground "DarkSlateGray")) (((background dark)) (:foreground "DarkSlateGray")))))
