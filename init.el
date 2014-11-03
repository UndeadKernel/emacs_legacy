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
)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 '(org-hide ((((background light)) (:foreground "DarkSlateGray")) (((background dark)) (:foreground "DarkSlateGray")))))
