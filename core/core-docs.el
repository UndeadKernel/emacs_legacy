;;; core-docs.el

(use-package zeal-at-point
  :when (not IS-MAC)
  :commands (zeal-at-point zeal-at-point-set-docset)
  :init
  (defun doom-docs-lookup (&optional search all)
    (let ((zeal-at-point-docset (if all "" zeal-at-point-docset)))
      (zeal-at-point search))))

(defmacro def-docset! (mode docset)
  (when IS-LINUX
    `(add-hook! ,mode
                (setq-local zeal-at-point-docset ,docset))))

(provide 'core-docs)
;;; core-docs.el ends here
