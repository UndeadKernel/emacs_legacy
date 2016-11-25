;;; defuns-window.el --- library for acting on windows

;;;###autoload
(defun doom/new-buffer ()
  (interactive)
  (switch-to-buffer (generate-new-buffer "*new*")))

;;;###autoload
(defun doom/new-frame ()
  (interactive)
  (let ((nlinum-p (and (featurep 'nlinum)
                       (memq 'nlinum--setup-window window-configuration-change-hook))))
    ;; Disable nlinum to fix elusive "invalid face linum" bug
    (remove-hook 'window-configuration-change-hook 'nlinum--setup-window t)
    (let ((frame (new-frame))
          (frame-name (format "*new-%s*" (length doom-wg-frames))))
      (with-selected-frame frame
        (wg-create-workgroup frame-name t)
        (add-to-list 'doom-wg-frames (cons frame frame-name))))
    (when nlinum-p
      (add-hook 'window-configuration-change-hook 'nlinum--setup-window nil t))))

;;;###autoload
(defun doom/close-frame ()
  (interactive)
  (aif (assq (selected-frame) doom-wg-frames)
      (progn (wg-delete-workgroup (wg-get-workgroup (cdr it)))
             (delete-frame (car it)))
    (delete-frame)))


(provide 'defuns-window)
;;; defuns-window.el ends here
