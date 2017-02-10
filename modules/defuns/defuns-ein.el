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
         (cons #'doom--ein-reply-callback (list :callback callback)))))

;;;###autoload
(defun doom/company-ein-backend (command &optional arg &rest ignored)
  (interactive (list 'interactive))
  (case command
    (interactive (company-begin-backend 'doom/company-ein-backend))
    (prefix (company-anaconda-prefix))
    (candidates (cons :async #'doom--company-ein-callback))
    (location nil)
    (sorted t)))

(defun doom--collect-ein-buffer-links ()
  (let ((end (window-end))
        points)
    (save-excursion
      (goto-char (window-start))
      (while (re-search-forward "~?/.+\\|\s\\[" end t)
        (push (+ (match-beginning 0) 1) points))
      (nreverse points))))

;;;###autoload
(defun doom/ace-link-ein ()
  "Ace jump to links in ein notebooklist."
  (interactive)
  (let ((res (avy-with doom/ace-link-ein
               (avy--process
                (doom--collect-ein-buffer-links)
                #'avy--overlay-pre))))
    (when (numberp res)
      (goto-char (1+ res))
      (widget-button-press (point)))))

(provide 'defuns-ein)
;;; defuns-ein.el ends here
