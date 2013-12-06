;;---------------------Binds----------------------

; Smooth scroll down
(defun scrolleaAbajo ()
  "Un agradable scroll hacia abajo"
  (interactive)
  (forward-line)
  (recenter)
  )
(global-set-key "\M-n" 'scrolleaAbajo)

; Smooth scroll up
(defun scrolleaArriba ()
  "Un agradable scroll hacia arriba"
  (interactive)
  (previous-line 1 1)
  (recenter)
  )
(global-set-key "\M-p" 'scrolleaArriba)

; Execute shell
(global-set-key [S-f5] 'eshell)

; Save File
(global-set-key [f2] 'save-buffer)

; Open file
(global-set-key [f3] 'find-file)

; Search and Replace
(global-set-key [f4] 'query-replace)

; Go to line
(global-set-key [f5] 'goto-line)

; Make the buffer small
(global-set-key (quote [M-down]) 'enlarge-window) 

; Make buffer bigger
(global-set-key (quote [M-up]) 'shrink-window)

; Shrink buffer horizontally
(global-set-key (quote [M-left]) 'shrink-window-horizontally)

; Shrink buffer vertically
(global-set-key (quote [M-right]) 'enlarge-window-horizontally)

; Delete with SUPR and DEL keys
(global-set-key [delete] 'delete-char)
(global-set-key [kp-delete] 'delete-char)

; Do not overwrite with insert
(global-set-key [insert] 
		(function 
		 (lambda () (interactive) 
		   (message "Sorry, overwrite mode has been disabled forever."))))

		   ;Undo
(global-set-key "\C-z" 'undo)

;Compile
(global-set-key [f8] 'compile)

;Recompile
(global-set-key [f9] 'recompile)

; Mouse whell on X
(cond (window-system
       (mwheel-install)
	   (setq mouse-wheel-scroll-amount '(2 ((shift) . 1)))
	   (setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
	   (setq mouse-wheel-follow-mosue 't) ;; scroll window under mouse
))