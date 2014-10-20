;;---------------------- Formato -----------------------

; Font size, type, position, etc...
;; (setq default-frame-alist
;;       '(
;; 	(font . "-*-lucidatypewriter-*-*-*-*-14-140-*-*-*-*-*")
;; 	(frame-title-format '("%b"))
;; 	))
(set-default-font "Inconsolata-11")

;;------------------ Emacs Colors ----------------------

; Background color for X.
(if ( or (eq window-system 'w32) (eq window-system 'x))
    (set-background-color "DarkSlateGray"))

(set-foreground-color "white") ; Font color
(set-mouse-color      "black") ; Mouse color
(set-cursor-color     "blue") ; Cursor color

; Use color highlighting if supported
(global-font-lock-mode t)
; Let parentheses be closed
(show-paren-mode 1)

; Constants
'(font-lock-constant-face ((((class color) (background light)) (:foreground "#6446ad"))))

; Colors for the mark region
(setq transient-mark-mode t)

; No toolbar
(tool-bar-mode -1)

; Yes menubar
(menu-bar-mode 1)
