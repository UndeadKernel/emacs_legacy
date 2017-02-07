;;; module-latex.el

(defvar doom-bibtex-dir "~/Documents/CASED/Papers/bib/")
(defvar doom-bibtex-pdf "~/Papers")

(load "auctex.el" nil t t)

(use-package tex-site
  :mode ("\\.tex\\'" . LaTeX-mode)
  :init
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
          ;; Qualified citation lists
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
  :config
  (setq
        ;; Enable parse on load.
        TeX-parse-self t
        ;; Enable parse on save.
        TeX-auto-save t
        TeX-auto-local ".auctex-auto"
        TeX-style-local ".auctex-style"
        ;; Item indentation.
        LaTeX-item-indent 0
        ;; Fonts for section, subsection, etc
        font-latex-fontify-sectioning 1.15)
  (setq-default TeX-master nil)
  ;; Load the AUCTEX thing now
  (use-package latex
    :commands (LaTeX-mode TeX-mode texinfo-mode)
    :config
    ;; Do not prompt for the Master file, this allows auto-insert to add templates to .tex files
    (add-hook 'LaTeX-mode-hook '(lambda () (remove-hook 'find-file-hooks (car find-file-hooks) 'local)))
    (add-hook 'TeX-mode-hook '(lambda () (remove-hook 'find-file-hooks (car find-file-hooks) 'local)))
    ;; Adding our standard latex mode hooks
    (add-hook! LaTeX-mode (LaTeX-math-mode) (flyspell-mode) (turn-on-reftex) (LaTeX-preview-setup))
    (TeX-global-PDF-mode t)
    (TeX-PDF-mode t)
    (setq ispell-dictionary "english")
    ;; Configure Okular as viewer. Fix a bug (https://bugs.kde.org/show_bug.cgi?id=373855)
    (setq TeX-view-program-list '(("Okular-fix" ("okular --unique file:%o" (mode-io-correlate "#src:%n%a"))))
          TeX-view-program-selection '((output-pdf "Okular-fix"))
          TeX-source-correlate-mode t
          TeX-source-correlate-method 'synctex
          TeX-source-correlate-start-server nil)
                                        ; Automatically activate TeX-fold-mode.
    (TeX-fold-mode 1)))

(use-package preview
  :commands LaTeX-preview-setup
  :init
  (progn
    (setq-default preview-scale 1.4
                  preview-scale-function '(lambda () (* (/ 10.0 (preview-document-pt)) preview-scale)))))

(use-package reftex
  :commands turn-on-reftex
  :init
  (setq reftex-plug-into-AUCTeX t
        reftex-ref-style-default-list '("Cleveref" "Hyperref" "Fancyref")
        reftex-default-bibliography
          `(,(expand-file-name "CASED.bib" doom-bibtex-dir)))
  ; Get ReTeX with biblatex
  ; http://tex.stackexchange.com/questions/31966/setting-up-reftex-with-biblatex-citation-commands/31992#31992
  (setq reftex-cite-format
        '((?t . "\\textcite[]{%l}")
          (?a . "\\autocite[]{%l}")
          (?c . "\\cite[]{%l}")
          (?s . "\\smartcite[]{%l}")
          (?f . "\\footcite[]{%l}")
          (?n . "\\nocite{%l}")
          (?b . "\\blockcquote[]{%l}{}"))))

(use-package bibtex
  :defer t
  :mode ("\\.bib" . bibtex-mode)
  :init
  (progn
    (setq bibtex-align-at-equal-sign t)))

(use-package ivy-bibtex
  :commands ivy-bibtex
  :config
  (setq bibtex-completion-bibliography (list (f-expand "CASED.bib" doom-bibtex-dir))
        bibtex-completion-library-path (list doom-bibtex-pdf)
        bibtex-completion-pdf-field "file"
        bibtex-completion-notes-path (f-expand "notes.org" doom-bibtex-pdf)
        bibtex-completion-pdf-open-function
            (lambda (fpath) (async-start-process "open-pdf" "/usr/bin/xdg-open" nil fpath))))

(provide 'module-latex)
;;; module-latex.el ends here
