; Math mode for LaTex
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

; Spellchecking for latex.
(add-hook 'latex-mode-hook 'flyspell-mode)
(add-hook 'tex-mode-hook 'flyspell-mode)
(add-hook 'bibtex-mode-hook 'flyspell-mode)

; Show line-number and column-number in the mode line
(line-number-mode 1)
(column-number-mode 1)
 
; highlight current line
;(global-hl-line-mode 1)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(TeX-PDF-mode t)
 '(TeX-source-correlate-method (quote synctex))
 '(TeX-source-correlate-mode t)
 '(TeX-source-correlate-start-server t)
 '(TeX-view-program-list (quote (("Okular" "okular %o#src:%n%b"))))
 '(TeX-view-program-selection (quote ((output-pdf "Okular") ((output-dvi style-pstricks) "dvips and gv") (output-dvi "xdvi") (output-pdf "Okular") (output-html "xdg-open")))))
