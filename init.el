;--------------------------------------------------------------------
; .emacs by Carlos García                                           ;
;--------------------------------------------------------------------

;;--------------------- Global Config -------------------------------
; Set the 'gui-window-system' to 't' or 'nil'.
(setq gui-window-system (if window-system t 'nil))


;;------------------------- PATH ------------------------------------
(add-to-list 'load-path "~/.emacs.d/")

;;------------------ General Configuration Options ------------------
(load "conf")

;;--------------------------- Key Bindings --------------------------
(load "binds")

;;------------------------- File Extensions -------------------------
(load "extensions")

;;-------------------------- How Emacs Looks ------------------------
;(load "looks")
(load "appearance")

;;---------------------------- Plugins ------------------------------
(load "plugins")

;;----------------------- Mode Configuration ------------------------
(load "modes")

;;--------------------- Local Customizations ------------------------
(load "local")

;;--------------------- Custom Emacs Config -------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-hide ((((background light)) (:foreground "DarkSlateGray")) (((background dark)) (:foreground "DarkSlateGray")))))
