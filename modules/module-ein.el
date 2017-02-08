;;; module-ein.el --- Interact with Jupyter notebooks

(use-package ein
  :commands (ein:notebooklist-open)
  :init
  (def-popup! "\\*ein:notebooklist *" :regexp t :align left :size 60 :select t)
  (add-hook! 'ein:notebook-mode-hook
    (define-key ein:notebook-mode-map (kbd "<C-tab>") 'doom/company-ein-backend)
    (define-key ein:notebook-mode-map [remap ein:completer-complete] 'doom/company-ein-backend)
    (define-key ein:notebook-mode-map (kbd "C-M-i") 'doom/company-ein-backend)
    (anaconda-mode))
  ;; Ein uses request to store http cookies. Store them in the cache dir.
  (setq request-storage-directory (concat doom-cache-dir "/request"))
  :config
  (require 'ein-loaddefs)
  (require 'ein)
  (setq
        ;; Slide images into rows so that we can navigate buffers with images more easily
        ein:slice-image t
        ;; Enable undo even after modifying cells
        ein:worksheet-enable-undo 'full
        ein:notebook-modes
            '(ein:notebook-multilang-mode ein:notebook-python-mode ein:notebook-plain-mode))
)


(provide 'module-ein)
;;; module-ein.el ends here
