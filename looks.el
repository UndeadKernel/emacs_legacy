;;---------------------- Formato -----------------------
;Tamaño de letra, tipografia, posición de X con Y, etc..
(setq default-frame-alist
      '(
	(font . "-*-lucidatypewriter-*-*-*-*-14-140-*-*-*-*-*")
	(frame-title-format '("%b"))
	))

;;------------------ Emacs Colors ----------------------
; Background color for X.
(if ( or (eq window-system 'w32) (eq window-system 'x))
    (set-background-color "DarkSlateGray"))

(set-foreground-color "white") ;Color de la letra
(set-mouse-color      "black") ;Color del mouse
(set-cursor-color     "blue") ;Color del cursor

;Permitir que cualquier archivo que soporte 'highlight' use colores:
(global-font-lock-mode t)
;Que se cierren los parentesis
(show-paren-mode 1)
;;Colores en especial:
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
)

; Constants
'(font-lock-constant-face ((((class color) (background light)) (:foreground "#6446ad"))))

; Colors for the mark region
(setq transient-mark-mode t)

; No toolbar
(tool-bar-mode -1)

; Yes menubar
(menu-bar-mode 1)
