;;------------------------- Markdown Mode -----------------------
(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)

;;----------------------- White space Mode ----------------------

;; display only tails of lines longer than 80 columns, tabs and
;; trailing white spaces
(require 'whitespace)
(setq whitespace-line-column 110)
(setq-default whitespace-style '(face tabs trailing lines-tail))

;; face for long lines' tails
(set-face-attribute 'whitespace-line nil
                    :background "red1"
                    :foreground "yellow"
                    :weight 'bold)

;; face for Tabs
(set-face-attribute 'whitespace-tab nil
                    :background "red1"
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

;(add-hook 'js-mode-hook 'whitespace-mode)

;;-------------------------- C++ Mode --------------------------

(add-hook 'c++-mode-hook
    (function (lambda ()
        (require 'member-functions)
        (local-set-key (kbd "C-c e") 'expand-member-functions)
    ))
)


;;------------------------- AUCTex Mode ------------------------

; Try to load auctex, if we fail, do not report anything.
(load "auctex.el" t t t)
(load "preview-latex.el" t t t)

; PDF mode (rather than DVI-mode)
(require 'tex)
(TeX-global-PDF-mode t)
(TeX-PDF-mode t)

(setq TeX-parse-self t); Enable parse on load.
(setq TeX-auto-save t); Enable parse on save.
(setq-default TeX-master nil)

; Item indentation.
(setq LaTeX-item-indent 0)

; Fonts for section, subsection, etc
(setq font-latex-fontify-sectioning 1.15)

; Enable Flyspell mode for TeX modes such as AUCTeX. Highlights all misspelled words.
(add-hook 'TeX-mode-hook 'flyspell-mode)
; Enable Flyspell program mode for emacs lisp mode, which highlights all misspelled words in comments and strings.
(add-hook 'emacs-lisp-mode-hook 'flyspell-prog-mode)
; Default dictionary. To change do M-x ispell-change-dictionary RET.
(setq ispell-dictionary "english")

; Set Okular as viewer.
;(setq TeX-view-program-list '(("Okular" "okular -unique %o#src:%n%(dir)./%b")))
(setq TeX-view-program-list '(("Okular" "okular --unique '%o#src:%n%(masterdir)./%b'")))
(setq TeX-view-program-selection '((output-pdf "Okular")))
; Sync with Okular
(setq TeX-source-correlate-mode t)
(setq TeX-source-correlate-method 'synctex)
(setq TeX-source-correlate-start-server t)

(add-hook 'TeX-mode-hook
          (lambda ()
	    ; Correct sync definition for Okular.
	    (add-to-list 'TeX-expand-list '("%(masterdir)" (lambda nil (file-truename (TeX-master-directory)))))
	    (add-to-list 'TeX-expand-list '("%(dir)" (lambda() default-directory)))
            ; Automatically activate TeX-fold-mode.
            (TeX-fold-mode 1)
            ; Use Latexmk instead of normal LaTeX.
            (push
             '("Latexmk" "latexmk -pdf %s" TeX-run-TeX nil t
               :help "Run Latexmk on file")
             TeX-command-list)
            ; Soft wrap lines.
            (set-fill-column 110)
            ;; This next mode inserts soft line breaks instead of hard ones after
            ;; ... a line goes beyond fill-column
            ;(longlines-mode)
            ;(turn-on-auto-fill)
          )
)
; Disable language-specific hyphen insertion.
(setq LaTeX-babel-hyphen nil)

; " expands into csquotes macros (for this to work babel must be loaded after csquotes).
(setq LaTeX-csquotes-close-quote "}"
      LaTeX-csquotes-open-quote "\\enquote{")

; LaTeX-math-mode http://www.gnu.org/s/auctex/manual/auctex/Mathematics.html
(add-hook 'TeX-mode-hook 'LaTeX-math-mode)

;; RefTeX
; Turn on RefTeX for AUCTeX http://www.gnu.org/s/auctex/manual/reftex/reftex_5.html
(add-hook 'TeX-mode-hook 'turn-on-reftex)

(eval-after-load 'reftex-vars; Is this construct really needed?
  '(progn
     (setq reftex-cite-prompt-optional-args t); Prompt for empty optional arguments in cite macros.
     ;; Make RefTeX interact with AUCTeX, http://www.gnu.org/s/auctex/manual/reftex/AUCTeX_002dRefTeX-Interface.html
     (setq reftex-plug-into-AUCTeX t)
     ;; So that RefTeX also recognizes \addbibresource. Note that you
     ;; can't use $HOME in path for \addbibresource but that "~"
     ;; works.
     (setq reftex-bibliography-commands '("bibliography" "nobibliography" "addbibresource"))
;     (setq reftex-default-bibliography '("UNCOMMENT LINE AND INSERT PATH TO YOUR BIBLIOGRAPHY HERE")); So that RefTeX in Org-mode knows bibliography
     (setcdr (assoc 'caption reftex-default-context-regexps) "\\\\\\(rot\\|sub\\)?caption\\*?[[{]"); Recognize \subcaptions, e.g. reftex-citation
     (setq reftex-cite-format; Get ReTeX with biblatex, see http://tex.stackexchange.com/questions/31966/setting-up-reftex-with-biblatex-citation-commands/31992#31992
           '((?t . "\\textcite[]{%l}")
             (?a . "\\autocite[]{%l}")
             (?c . "\\cite[]{%l}")
             (?s . "\\smartcite[]{%l}")
             (?f . "\\footcite[]{%l}")
             (?n . "\\nocite{%l}")
             (?b . "\\blockcquote[]{%l}{}")))))

;; Fontification (remove unnecessary entries as you notice them) http://lists.gnu.org/archive/html/emacs-orgmode/2009-05/msg00236.html http://www.gnu.org/software/auctex/manual/auctex/Fontification-of-macros.html
(setq font-latex-match-reference-keywords
      '(
        ;; biblatex
        ("printbibliography" "[{")
        ("addbibresource" "[{")
        ;; Standard commands
        ;; ("cite" "[{")
        ("Cite" "[{")
        ("parencite" "[{")
        ("Parencite" "[{")
        ("footcite" "[{")
        ("footcitetext" "[{")
        ;; ;; Style-specific commands
        ("textcite" "[{")
        ("Textcite" "[{")
        ("smartcite" "[{")
        ("Smartcite" "[{")
        ("cite*" "[{")
        ("parencite*" "[{")
        ("supercite" "[{")
        ; Qualified citation lists
        ("cites" "[{")
        ("Cites" "[{")
        ("parencites" "[{")
        ("Parencites" "[{")
        ("footcites" "[{")
        ("footcitetexts" "[{")
        ("smartcites" "[{")
        ("Smartcites" "[{")
        ("textcites" "[{")
        ("Textcites" "[{")
        ("supercites" "[{")
        ;; Style-independent commands
        ("autocite" "[{")
        ("Autocite" "[{")
        ("autocite*" "[{")
        ("Autocite*" "[{")
        ("autocites" "[{")
        ("Autocites" "[{")
        ;; Text commands
        ("citeauthor" "[{")
        ("Citeauthor" "[{")
        ("citetitle" "[{")
        ("citetitle*" "[{")
        ("citeyear" "[{")
        ("citedate" "[{")
        ("citeurl" "[{")
        ;; Special commands
        ("fullcite" "[{")))

(setq font-latex-match-textual-keywords
      '(
        ;; biblatex brackets
        ("parentext" "{")
        ("brackettext" "{")
        ("hybridblockquote" "[{")
        ;; Auxiliary Commands
        ("textelp" "{")
        ("textelp*" "{")
        ("textins" "{")
        ("textins*" "{")
        ;; supcaption
        ("subcaption" "[{")))

(setq font-latex-match-variable-keywords
      '(
        ;; amsmath
        ("numberwithin" "{")
        ;; enumitem
        ("setlist" "[{")
        ("setlist*" "[{")
        ("newlist" "{")
        ("renewlist" "{")
        ("setlistdepth" "{")
        ("restartlist" "{")))


;;-------------------------- Org Mode -------------------------

; Export with no more than 4 levels.
(setq org-export-with-toc 4)
(setq org-export-headline-levels 4)
; Start org mode showing everything (not folded).
(setq org-startup-folded "showall")
; Not sure about this one...
(setq org-startup-align-all-tables "align")
; Hide leading stars
(setq org-hide-leading-stars t)
(if ( or (eq window-system 'w32) (eq window-system 'x))
    ; then ---
    (custom-set-faces
     '(org-hide ((((background light)) (:foreground "DarkSlateGray"))
                 (((background dark)) (:foreground "DarkSlateGray"))))
     )
    ; else ---
    (custom-set-faces
     '(org-hide ((((background light)) (:foreground "black"))
                 (((background dark)) (:foreground "black"))))
     )
)
; Hide markers for bold, italics, etc
(setq org-hide-emphasis-markers t)
; HOOK
(add-hook 'org-mode-hook (lambda()
    ; Turn on automatic indentation
    (turn-on-auto-fill)
    ; Set the indentation column
    (set-fill-column 90)
    ; Indent the headers automatically.
    (org-indent-mode t)
    ; Turn on the spellchecker
    (flyspell-mode)
))
