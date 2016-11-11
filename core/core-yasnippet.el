;;; core-yasnippet.el

(use-package yasnippet
  :mode ("emacs\\.d/private/\\(snippets\\|templates\\)/.+$" . snippet-mode)
  :commands (yas-minor-mode
             yas-minor-mode-on
             yas-expand
             yas-insert-snippet
             yas-new-snippet
             yas-visit-snippet-file)
  :init
  (defvar yas-minor-mode-map (make-sparse-keymap))
  (setq yas-verbosity 0
        yas-indent-line 'auto
        yas-also-auto-indent-first-line t
        ; TODO: Make yasnippet use helm
        yas-prompt-functions '(yas-ido-prompt yas-no-prompt)
        ;; Only load personal snippets
        yas-snippet-dirs (list (concat doom-private-dir "/snippets")
                               (concat doom-private-dir "/templates")))

  (add-hook! (text-mode prog-mode snippet-mode markdown-mode org-mode)
    'yas-minor-mode-on)

  :config
  (yas-reload-all)
  ;; Fix an issue with smartparens interfering with yasnippet keybindings
  (advice-add 'yas-expand :before 'sp-remove-active-pair-overlay)
  ;; Strip out whitespace before a line selection
  (add-hook 'yas-before-expand-snippet-hook 'doom|yas-before-expand)
  ;; Fix previous hook persisting yas-selected-text between expansions
  (add-hook 'yas-after-exit-snippet-hook 'doom|yas-after-expand))

(use-package auto-yasnippet
  :commands (aya-create aya-expand aya-open-line aya-persist-snippet)
  :config (setq aya-persist-snippets-dir (concat doom-private-dir "auto-snippets/")))

(provide 'core-yasnippet)
;;; core-yasnippet.el ends here
