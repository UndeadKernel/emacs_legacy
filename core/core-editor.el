;;; core-editor.el

(global-auto-revert-mode 1)    ; revert buffers for changed files
;; Enable syntax highlighting for older emacs
(unless (bound-and-true-p global-font-lock-mode)
  (global-font-lock-mode t))

(setq-default
 ;; Formatting
 delete-trailing-lines nil
 fill-column 80
 ;; Spaces, not tabs
 indent-tabs-mode nil
 require-final-newline t
 tab-always-indent t
 tab-width 4
 ;; Wrapping
 truncate-lines t
 truncate-partial-width-windows 50
 visual-fill-column-center-text nil
 word-wrap t
 ;; Scrolling
 hscroll-margin 1
 hscroll-step 1
 scroll-conservatively 1001
 scroll-margin 0
 scroll-preserve-screen-position t
 ;; Regions
 shift-select-mode t
 ;; Whitespace
 tabify-regexp "^\t* [ \t]+"
 whitespace-line-column fill-column
 whitespace-style '(face tabs tab-mark
                    trailing indentation lines-tail)
 whitespace-display-mappings
 '((tab-mark ?\t [?› ?\t])
   (newline-mark 10 [36 10])))

;; Save point across sessions
(require 'saveplace)
(setq-default
 save-place-file (concat doom-cache-dir "/saveplace")
 save-place t)
(when (>= emacs-major-version 25)
  (save-place-mode +1))

;; Save history across sessions
(require 'savehist)
(setq savehist-file (concat doom-cache-dir "/savehist")
      savehist-save-minibuffer-history t
      savehist-additional-variables
      '(kill-ring search-ring regexp-search-ring))
(savehist-mode 1)

;; Remove text property cruft from history
(defun unpropertize-savehist ()
  (mapc (lambda (list)
          (when (boundp list)
            (set list (mapcar 'substring-no-properties (eval list)))))
        '(kill-ring minibuffer-history helm-grep-history helm-ff-history
          file-name-history read-expression-history extended-command-history)))
(add-hook 'kill-emacs-hook    'unpropertize-savehist)
(add-hook 'savehist-save-hook 'unpropertize-savehist)

;; Keep track of recently opened files
(require 'recentf)
(setq recentf-save-file (concat doom-cache-dir "/recentf")
      recentf-exclude '("/tmp/" "/ssh:" "\\.?ido\\.last$" "\\.revive$" "/TAGS$"
                        "emacs\\.d/private/cache/.+" "emacs\\.d/workgroups/.+$"
                        "wg-default" "/company-statistics-cache.el$"
                        "^/var/folders/.+$" "^/tmp/.+")
      recentf-max-menu-items 0
      recentf-max-saved-items 250
      recentf-auto-cleanup 600
      recentf-filename-handlers '(abbreviate-file-name))
(recentf-mode 1)

;; window config undo/redo
(setq winner-dont-bind-my-keys t)
(require 'winner)
;; Ignore all special buffers
(advice-add 'winner-window-list :filter-return 'doom*winner-window-list)
(defun doom*winner-window-list (windows)
  (-remove (lambda (win) (string-match-p "^\\s-*\\*" (buffer-name (window-buffer win))))
           windows))
(winner-mode 1)


;; Let editorconfig handle global whitespace settings
(use-package editorconfig :demand t
  :mode ("\\.?editorconfig$" . editorconfig-conf-mode)
  :config (editorconfig-mode +1)
  (push 'doom-mode editorconfig-exclude-modes)
  ;; Show whitespace in tabs indentation mode
  (add-hook! 'editorconfig-custom-hooks
    (if indent-tabs-mode (whitespace-mode +1))))


;;
;; Hooks 'n hacks
;;

(associate! makefile-gmake-mode :match "/Makefile$")
(add-hook! special-mode (setq truncate-lines nil))
;; If file is oversized...
(add-hook! find-file
  (when (> (buffer-size) 1048576)
    (setq buffer-read-only t)
    (buffer-disable-undo)
    (fundamental-mode)
    (visual-line-mode)))
 
;; Disable by default, please
(electric-indent-mode -1)
;; Smarter, keyword-based electric-indent (see `def-electric!')
(defvar doom-electric-indent-p nil)
(defvar-local doom-electric-indent-words '())
(setq electric-indent-chars '(?\n ?\^?))
(push (lambda (c)
        (when (and (eolp) doom-electric-indent-words)
          (save-excursion
            (backward-word)
            (looking-at-p
             (concat "\\<" (regexp-opt doom-electric-indent-words))))))
      electric-indent-functions)


;;
;; Plugins
;;

;; (use-package ace-window
;;   :commands ace-window
;;   :config
;;   (setq aw-scope 'frame
;;         aw-background t)
;;   ;; Make the special window character bigger, blue and boxed.
;;   (set-face-attribute 'aw-leading-char-face nil
;;                       :foreground "deep sky blue" :weight 'bold :height 3.0
;;                       :box t))

(use-package switch-window
  :commands switch-window)

(use-package avy
  :commands (avy-goto-char-2 avy-goto-line)
  :config (setq avy-all-windows nil
                avy-background t))

(use-package ace-link
  :commands (ace-link-help ace-link-info ace-link-org))

(use-package dumb-jump
  :commands (dumb-jump-go dumb-jump-quick-look dumb-jump-back)
  :config
  (setq dumb-jump-default-project doom-emacs-dir)
  (dumb-jump-mode +1))

(use-package emr
  :commands (emr-show-refactor-menu emr-declare-command)
  :config
  (emr-initialize)
  (define-key popup-menu-keymap [escape] 'keyboard-quit))

(use-package expand-region
  :commands (er/expand-region er/contract-region er/mark-symbol er/mark-word))

(use-package goto-last-change :commands goto-last-change)

(use-package hideshow
  :commands (hs-minor-mode hs-toggle-hiding hs-already-hidden-p)
  :config (setq hs-isearch-open t)
  :init
  ;; Prettify code folding in emacs
  (define-fringe-bitmap 'hs-marker [16 48 112 240 112 48 16] nil nil 'center)
  (defface hs-face '((t (:background "#ff8")))
    "Face to hightlight the ... area of hidden regions"
    :group 'hideshow)
  (defface hs-fringe-face '((t (:foreground "#888")))
    "Face used to highlight the fringe on folded regions"
    :group 'hideshow)
  (setq hs-set-up-overlay
        (lambda (ov)
          (when (eq 'code (overlay-get ov 'hs))
            (let* ((marker-string "*")
                   (display-string (concat " " (all-the-icons-octicon "ellipsis" :v-adjust 0) " "))
                   (len (length display-string)))
              (put-text-property 0 1 'display
                                 (list 'right-fringe 'hs-marker 'hs-fringe-face)
                                 marker-string)
              (put-text-property 0 1 'face 'hs-face display-string)
              (put-text-property (1- len) len 'face 'hs-face display-string)
              (put-text-property 1 (1- len)
                                 'face `(:inherit hs-face :family ,(all-the-icons-octicon-family) :height 1.1)
                                 display-string)
              (overlay-put ov 'before-string marker-string)
              (overlay-put ov 'display display-string))))))
 
(use-package help-fns+ ; Improved help commands
  :commands (describe-buffer describe-command describe-file
             describe-keymap describe-option describe-option-of-type))

(use-package imenu-list
  :commands imenu-list-minor-mode
  :config
  (setq imenu-list-mode-line-format nil
        imenu-list-position 'right
        imenu-list-size 32))

(use-package re-builder
  :commands (re-builder reb-mode-buffer-p)
  :config
  (setq reb-re-syntax 'string))

(use-package smart-forward
  :commands (smart-up smart-down smart-backward smart-right))

(use-package smartparens
  :config
  (setq sp-autowrap-region t
        sp-highlight-pair-overlay nil
        sp-cancel-autoskip-on-backward-movement nil
        sp-show-pair-delay 0
        sp-max-pair-length 5)

  (smartparens-global-mode 1)
  ; TODO: fix the font style of the line numbers when the first character is a parenthesis and is highlighted
  (show-smartparens-global-mode t)
  (require 'smartparens-config)

  ;; Auto-close more conservatively
  (sp-pair "'" nil :unless '(sp-point-after-word-p))
  (sp-pair "\"" nil :unless '(sp-point-before-word-p sp-point-after-word-p sp-point-before-same-p))
  (sp-pair "{" nil :post-handlers '(("||\n[i]" "RET") ("| " " "))
                   :unless '(sp-point-before-word-p sp-point-before-same-p))
  (sp-pair "(" nil :post-handlers '(("||\n[i]" "RET") ("| " " "))
                   :unless '(sp-point-before-word-p sp-point-before-same-p))
  (sp-pair "[" nil :post-handlers '(("| " " "))
                   :unless '(sp-point-before-word-p sp-point-before-same-p))

  (sp-local-pair
   'css-mode "/*" "*/" :post-handlers '(("[d-3]||\n[i]" "RET") ("| " "SPC")))
  (sp-local-pair '(sh-mode markdown-mode) "`" nil
   :unless '(sp-point-before-word-p sp-point-before-same-p))
  (sp-with-modes '(xml-mode nxml-mode php-mode)
    (sp-local-pair "<!--" "-->"   :post-handlers '(("| " "SPC")))))

(use-package buffer-move
  :commands (buf-move-up buf-move-down buf-move-left buf-move-right))


(provide 'core-editor)
;;; core-editor.el ends here
