;;; defuns-git.el

;;;###autoload
(defun doom/git-root ()
  (awhen (car-safe (browse-at-remote--remote-ref buffer-file-name))
    (cdr (browse-at-remote--get-url-from-remote it))))

;;;###autoload
(defun doom/git-issues ()
  "Open the github issues page for current repo."
  (interactive)
  (awhen (doom/git-root)
    (browse-url (concat it "/issues"))))

;;;###autoload
(defun doom/git-magit ()
  (interactive)
  (call-interactively 'magit-status))

(provide 'defuns-git)
;;; defuns-git.el ends here
