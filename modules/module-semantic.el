;;; module-semantic.el --- Configure the Semantic backend that others might use

(use-package semantic
  :commands (semantic-mode)
  :init
  (setq semanticdb-default-save-directory (concat doom-cache-dir "/semantic")))

(provide 'module-semantic)
;;; module-semantic.el ends here
