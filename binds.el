;;---------------------Binds----------------------

; Scroll and recenter the text
(global-set-key "\M-n" 'my-down-scroll)
(global-set-key "\M-p" 'my-up-scroll)

; Work with macros
(defun toggle-kbd-macro-recording-on ()
  "One-key keyboard macros: turn recording on."
  (interactive)
  (define-key global-map (this-command-keys)
    'toggle-kbd-macro-recording-off)
  (start-kbd-macro nil))

(defun toggle-kbd-macro-recording-off ()
  "One-key keyboard macros: turn recording off."
  (interactive)
  (define-key global-map (this-command-keys)
    'toggle-kbd-macro-recording-on)
  (end-kbd-macro))

; Macro bindings
(global-set-key '[(f1)]       'call-last-kbd-macro)
(global-set-key '[(shift f1)] 'toggle-kbd-macro-recording-on)

; Save File
(global-set-key [f2] 'save-buffer)

; Open file
(global-set-key [f3] 'find-file)

; Search and Replace
(global-set-key [f4] 'query-replace)

; Go to line
(global-set-key [f5] 'revert-buffer)

; Execute shell
(global-set-key [S-f5] 'eshell)

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

;Compile
(global-set-key [f8] 'compile)

;Recompile
(global-set-key [f9] 'recompile)
