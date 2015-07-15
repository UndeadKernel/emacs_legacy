;--------------------------------------------------------------------
; .emacs by Carlos García Cordero                                   ;
;--------------------------------------------------------------------

;;--------------------- Global Config -------------------------------
; Set the 'gui-window-system' to 't' or 'nil'.
(setq gui-window-system (if window-system t 'nil))


;;------------------ General Configuration Options ------------------
(load-file "~/.emacs.d/conf.el")

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
 '(doc-view-ghostscript-options
   (quote
    ("-dSAFER" "-dNOPAUSE" "-sDEVICE=png16m" "-dTextAlphaBits=4" "-dBATCH" "-dGraphicsAlphaBits=4" "-dQUIET" "-r460")))
 '(doc-view-resolution 300))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-hide ((((background light)) (:foreground "DarkSlateGray")) (((background dark)) (:foreground "DarkSlateGray")))))
