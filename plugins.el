
;;---------------------- PATH ---------------------------
(add-to-list 'load-path "~/.emacs.d/plugins/")


;;------------------ Maximize Window --------------------
; For windows.
;(defun w32-maximize-frame ()
;  "Maximize the current frame"
;  (interactive)
;  (w32-send-sys-command 61488))
;(add-hook 'window-setup-hook 'w32-maximize-frame t)

; For linux
(require 'maxframe)
(setq mf-max-width 1920)
(add-hook 'window-setup-hook 'maximize-frame t)


;;---------------- Maic Latex Buffer --------------------
;(require 'magic-latex-buffer)


;;-------------------- Yasnippet ------------------------

(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-reload-all)
(yas-global-mode 1)
; Display a popup for the available options.
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete/lib/popup")
(require 'popup)
; Add some shotcuts in popup menu mode
(define-key popup-menu-keymap (kbd "M-n") 'popup-next)
(define-key popup-menu-keymap (kbd "TAB") 'popup-next)
(define-key popup-menu-keymap (kbd "<tab>") 'popup-next)
(define-key popup-menu-keymap (kbd "<backtab>") 'popup-previous)
(define-key popup-menu-keymap (kbd "M-p") 'popup-previous)

(defun yas-popup-isearch-prompt (prompt choices &optional display-fn)
  (when (featurep 'popup)
    (popup-menu*
     (mapcar
      (lambda (choice)
        (popup-make-item
         (or (and display-fn (funcall display-fn choice))
             choice)
         :value choice))
      choices)
     :prompt prompt
     ;; start isearch mode immediately
     :isearch t
     )))
(setq yas-prompt-functions '(yas-popup-isearch-prompt yas-no-prompt))
;; (add-hook 'js-mode-hook
;;               '(lambda ()
;;                  (yas-minor-mode)))


;;--------------------- Auto Complete----------------------

(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/auto-complete/dict")
(setq ac-comphist-file  "~/.emacs.d/plugins/auto-complete/ac-comphist.dat")
(ac-config-default)
; set the trigger key so that it can work together with yasnippet on tab key,
; if the word exists in yasnippet, pressing tab will cause yasnippet to
; activate, otherwise, auto-complete will
;(ac-set-trigger-key "TAB")
;(ac-set-trigger-key "<tab>")


;;-------------------- Smooth Scroll ----------------------

(require 'smooth-scrolling)


;;-------------- IDO Mode for changing buffers ------------

(require 'ido)
(ido-mode t)


;;----------------------- Tabbar --------------------------

;; (cond (window-system
;;        (require 'tabbar)
;;        (tabbar-mode 1)
;;        (global-set-key [(control shift up)] 'tabbar-backward-group)
;;        (global-set-key [(control shift down)] 'tabbar-forward-group)
;;        (global-set-key [(control shift left)] 'tabbar-backward)
;;        (global-set-key [(control shift right)] 'tabbar-forward)
;; ))
