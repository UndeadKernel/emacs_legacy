;;; defuns-ein.el --- Helper functions for module-ein.el

;;;###autoload
(defun doom--ein-reply-callback (args content -metadata-not-used-)
    (let ((callback (plist-get args :callback))
          (candidates (plist-get content :matches)))
      (funcall callback candidates)))

;;;###autoload
(defun doom--company-ein-callback (callback)
  (ein:kernel-complete
   (ein:get-kernel)
   (thing-at-point 'line)
   (current-column)
   (list :complete_reply
         (cons #'doom--ein-reply-callback (list :callback callback))))
  )

;;;###autoload
(defun doom/company-ein-backend (command &optional arg &rest ignored)
  (interactive (list 'interactive))
  (case command
    (interactive (company-begin-backend 'doom/company-ein-backend))
    (prefix (company-anaconda-prefix))
    (candidates (cons :async #'doom--company-ein-callback))
    (location nil)
    (sorted t)
    )
  )

(provide 'defuns-ein)
;;; defuns-ein.el ends here
