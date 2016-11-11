;;; defuns-flycheck.el
;; for ../core-flycheck.el

;;;###autoload
(defun doom/flycheck-errors ()
  (interactive)
  (when (bound-and-true-p flycheck-mode)
    (flycheck-buffer)
    (flycheck-list-errors)))

(provide 'defuns-flycheck)
;;; defuns-flycheck.el ends here
