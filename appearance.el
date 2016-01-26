;;----------------------- Cursor ------------------------
(setq-default cursor-type 'hollow)

;; Taken from https://github.com/jimeh/.emacs.d and edited by me.
;; Disable splash page
(setq inhibit-startup-message t)

;;----------------------- Fonts ------------------------
;; Set the default font
;; Large
(set-face-attribute 'default nil :family "Inconsolata" :height 110)
;; (set-face-attribute 'default nil :family "Monaco" :height 110)
;; (set-face-attribute 'default nil :family "Menlo" :height 110)
;; Small
;; (set-face-attribute 'default nil :family "Monaco" :height 100)
;; (set-face-attribute 'default nil :family "Menlo" :height 100)
;; (set-face-attribute 'default nil :family "Inconsolata" :height 110)


;;----------------------- Theme ------------------------
;; Change the appearance in GUI and terminal frames
(add-to-list 'load-path "~/.emacs.d/themes")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(if (display-graphic-p)
    (progn
      (require 'twilight-anti-bright-theme)
      (load-theme 'twilight-anti-bright t))
  (progn
    (load-theme 'seti t)))

;; Failed attempt at having different themes for the terminal and X with daemon emacs.
;; (require 'load-theme-buffer-local)
;; ; GUI theme
;; (require 'twilight-anti-bright-theme)
;; ;(load-theme 'twilight-anti-bright t t)
;; ; Console theme
;; (require 'tomorrow-night-paradise-theme)
;; ;(load-theme 'tomorrow-night-paradise t t)

;; ; Load the theme when using emacs in daemon mode.
;; (defun inmy-change-theme (frame)
;;   (select-frame frame)
;;   (if (display-graphic-p)
;;       (progn
;;         ;; (disable-theme 'tomorrow-night-paradise)
;;         ;; (enable-theme 'twilight-anti-bright)
;;         (load-theme-buffer-local 'twilight-anti-bright (current-buffer))
;;         (tool-bar-mode -1))
;;     (progn
;;       ;; (disable-theme 'twilight-anti-bright)
;;       ;; (enable-theme  'tomorrow-night-paradise)
;;       (load-theme-buffer-local 'tomorrow-night-paradise (current-buffer))
;;       (tool-bar-mode t))))
;; (add-hook 'after-make-frame-functions 'inmy-change-theme)

; Load theme when emacs is started as standalone.

;; Nyan cat magic
(add-to-list 'load-path "~/.emacs.d/plugins/nyan")
(setq nyan-wavy-trail t)
(setq nyan-bar-length 16)
(require 'nyan-mode)

;; Mode-line beauty
(setq-default
 mode-line-format
 '(; Position, including warning for 80 columns
   (:propertize "%4l:" face mode-line-position-face)
   (:eval (propertize "%3c" 'face
                      (if (>= (current-column) 80)
                          'mode-line-80col-face
                        'mode-line-position-face)))
   ; emacsclient [default -- keep?]
   mode-line-client
   " "
   ; read-only or modified status
   (:eval
    (cond (buffer-read-only
           (propertize " RO " 'face 'mode-line-read-only-face))
          ((buffer-modified-p)
           (propertize " ** " 'face 'mode-line-modified-face))
          (t "    ")))
   " "
   ; directory and buffer/file name
   (:propertize (:eval (shorten-directory default-directory 10))
                face mode-line-folder-face)
   (:propertize "%b "
                face mode-line-filename-face)
   ; nyan-mode uses nyan cat as an alternative to %p
   (:eval (list (nyan-create)))
   ; narrow [default -- keep?]
   ;" %n "
   ; mode indicators: vc, recursive edit, major mode, minor modes, process, global
   ;; (vc-mode vc-mode)
   " %["
   (:propertize mode-name
                face mode-line-mode-face)
   "%]"
   (:eval (propertize (format-mode-line minor-mode-alist)
                      'face 'mode-line-minor-mode-face))
   (:propertize mode-line-process
                face mode-line-process-face)
   (global-mode-string global-mode-string)
   ))

;; Mode-line helper function
(defun shorten-directory (dir max-length)
  "Show up to `max-length' characters of a directory name `dir'."
  (let ((path (reverse (split-string (abbreviate-file-name dir) "/")))
        (output ""))
    (when (and path (equal "" (car path)))
      (setq path (cdr path)))
    (while (and path (< (length output) (- max-length 4)))
      (setq output (concat (car path) "/" output))
      (setq path (cdr path)))
    (when path
      (setq output (concat ".../" output)))
    output))

;; Mode-line faces
(make-face 'mode-line-read-only-face)
(make-face 'mode-line-modified-face)
(make-face 'mode-line-folder-face)
(make-face 'mode-line-filename-face)
(make-face 'mode-line-position-face)
(make-face 'mode-line-mode-face)
(make-face 'mode-line-minor-mode-face)
(make-face 'mode-line-process-face)
(make-face 'mode-line-80col-face)

(let ((background "#14191f")
      (foreground "#dcdddd")
      (selection "#313c4d")
      (hl-line "#1b2129")
      (cursor "#b4b4b4")
      (comment "#716d73")

      (gray-1 "#878289")   (gray-1bg "#181d23")
      (gray-2 "#2a3441")
      (gray-3 "#b3adb4")   (gray-3bg "#0e1116")
      (gray-4 "#1f2730")
      (gray-5 "#242d38")
      (gray-6 "#192028")
      (gray-7 "#39424d")
      (red-1 "#d15120")    (red-1bg "#2a1f1f")
      (red-2 "#b23f1e")    (red-2bg "#251c1e")
      (red-3 "#c6350b")
      (brown-1 "#9f621d")  (brown-1bg "#2a1f1f")
      (orange-1 "#d97a35") (orange-1bg "#272122")
      (yellow-1 "#deae3e") (yellow-1bg "#2a2921")
      (green-1 "#81af34")  (green-1bg "#1a2321")
      (green-2 "#4e9f75")  (green-2bg "#1a2321")
      (blue-1 "#7e9fc9")   (blue-1bg "#1e252f")
      (blue-2 "#417598")   (blue-2bg "#1b333e")
      (blue-3 "#00959e")   (blue-3bg "#132228")
      (blue-4 "#365e7a")   (blue-4bg "#172028")
      (purple-1 "#a878b5") (purple-1bg "#25222f")
      )

  (set-face-attribute 'mode-line nil
                      :foreground blue-1 :background red-1bg
                      :inverse-video nil
                      :box '(:line-width 6 :color "#2a1f1f" :style nil))
  (set-face-attribute 'mode-line-inactive nil
                      :foreground blue-4 :background blue-1bg
                      :inverse-video nil
                      :box '(:line-width 6 :color "#1e252f" :style nil))

  (set-face-attribute 'mode-line-read-only-face nil
                      :inherit 'mode-line-face
                      :foreground "#4271ae"
                      :box '(:line-width 2 :color "#4271ae"))
  (set-face-attribute 'mode-line-modified-face nil
                      :inherit 'mode-line-face
                      :foreground "#c82829"
                      :background "#ffffff"
                      :box '(:line-width 2 :color "#c82829"))
  (set-face-attribute 'mode-line-folder-face nil
                      :inherit 'mode-line-face
                      :foreground "gray60")
  (set-face-attribute 'mode-line-filename-face nil
                      :inherit 'mode-line-face
                      :foreground "#eab700"
                      :weight 'bold)
  (set-face-attribute 'mode-line-position-face nil
                      :inherit 'mode-line-face
                      :family "Inconsolata" :height 100)
  (set-face-attribute 'mode-line-mode-face nil
                      :inherit 'mode-line-face
                      :foreground "gray80"
                      :weight 'bold)
  (set-face-attribute 'mode-line-minor-mode-face nil
                      :inherit 'mode-line-mode-face
                      :foreground "gray40"
                      :height 80)
  (set-face-attribute 'mode-line-process-face nil
                      :inherit 'mode-line-face
                      :foreground "#718c00")
  (set-face-attribute 'mode-line-80col-face nil
                      :inherit 'mode-line-position-face
                      :foreground "black" :background "#eab700")
  )
;; Enable menu-bar
(menu-bar-mode -1)

;; Disable the toolbar
(if gui-window-system (tool-bar-mode -1))

;; Disable Scrollbar
(set-scroll-bar-mode 'nil)

;; Show matching parentheses
(show-paren-mode t)

;; Show column number globally
(column-number-mode t)

;; Highlight current line globally
(global-hl-line-mode t)

;; Customize line numbers - In gui mode the fringe is the spacer between line
;; numbers and code, while in console mode we add an extra space for it.
(if gui-window-system
    (setq linum+-dynamic-format " %%%dd")
    (setq linum+-dynamic-format " %%%dd "))

;; Linum+ resets linum-format to "smart" when it's loaded, hence we have to
;; use a eval-after-load hook to set it to "dynamic".
(eval-after-load "linum+" '(progn (setq linum-format 'dynamic)))

;; meaningful names for buffers with the same name
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t)    ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

;; Cursor
(blink-cursor-mode t)
; Never stop blinking the cursor. Default: stop after 10 blinks.
(setq blink-cursor-blinks 0)
(setq initial-frame-alist
      (cons '(cursor-type . bar) (copy-alist initial-frame-alist)))
(setq default-frame-alist
      (cons '(cursor-type . bar) (copy-alist default-frame-alist)))

;; Some transparency
(setq transparency-level 99)
(set-frame-parameter nil 'alpha transparency-level)
(add-hook 'after-make-frame-functions
          (lambda (selected-frame)
            (set-frame-parameter selected-frame 'alpha transparency-level)))



;; Relative line numbers -- from: http://stackoverflow.com/a/6928112/42146
;; (defvar my-linum-format-string "%3d ")
;; ;; (add-hook 'linum-before-numbering-hook 'my-linum-get-format-string)
;; (defun my-linum-get-format-string ()
;;   (let* ((width (1+ (length (number-to-string
;;                              (count-lines (point-min) (point-max))))))
;;          (format (concat "%" (number-to-string width) "d")))
;;     (setq my-linum-format-string format)))
;; (defvar my-linum-current-line-number 0)
;; (setq linum-format 'my-linum-relative-line-numbers)
;; (defun my-linum-relative-line-numbers (line-number)
;;   (let ((offset (abs(- line-number my-linum-current-line-number))))
;;     (propertize (format my-linum-format-string offset) 'face 'linum)))
;; (defadvice linum-update (around my-linum-update)
;;   (let ((my-linum-current-line-number (line-number-at-pos)))
;;     ad-do-it))
;; (ad-activate 'linum-update)

;;----------------------- White space Mode ----------------------
;; display only tails of lines longer than 110 columns, tabs and
;; trailing white spaces
(require 'whitespace)
(setq whitespace-line-column 110)
(setq-default whitespace-style '(face tabs trailing lines-tail))

;; face for long lines' tails
(set-face-attribute 'whitespace-line nil
                    :background "#31191f"
                    :foreground "yellow"
                    :weight 'bold)

;; face for Tabs
(set-face-attribute 'whitespace-tab nil
                    :background "#31191f"
                    :foreground "yellow"
                    :weight 'bold)
;; face for spaces
(set-face-attribute 'whitespace-trailing nil
                    :background "#31191f"
                    :foreground "yellow"
                    :weight 'bold)

;; Customize Whitespace Characters
;;  - Newline: \u00AC = ¬
;;  - Tab:     \u2192 = →
;;             \u00BB = »
;;             \u25B6 = ▶
(setq whitespace-display-mappings
      (quote ((newline-mark ?\n [?\u00AC ?\n] [?$ ?\n])
              (tab-mark     ?\t [?\u2192 ?\t] [?\u00BB ?\t] [?\\ ?\t]))))

(setq whitespace-style
      (quote (face tabs trailing space-before-tab newline
                   indentation space-after-tab tab-mark newline-mark
                   empty)))

;; activate minor whitespace mode for all files.
(global-whitespace-mode t)
