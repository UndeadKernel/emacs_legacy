;--------------------------------------------------------------------
; .emacs by Carlos García                                           ;
;--------------------------------------------------------------------



;;------------------------- PATH ------------------------------------
(add-to-list 'load-path "~/.emacs.d/")

;;------------------ General Configuration Options ------------------
(load "conf")

;;--------------------------- Key Bindings --------------------------
(load "binds")

;;------------------------- File Extensions -------------------------
(load "extensions")

;;-------------------------- How Emacs Looks ------------------------
(load "looks")

;;---------------------------- Plugins ------------------------------
(load "plugins")

;;----------------------- Mode Configuration ------------------------
(load "modes")

;;--------------------- Local Customizations ------------------------
(load "local")

;;--------------------- Custom Emacs Config -------------------------
(custom-set-variables
  ;; custom-set-variables was added by Custom.
)

(custom-set-faces
  ;; custom-set-faces was added by Custom.
)
