;;; defuns-repl.el --- Custom REPL activation function

;;;###autoload
(defun doom/repl (&optional send-input)
  "Toggle to an interactive REPL session that matches the major mode of the current buffer."
  (interactive "P")
  (cond
   ;; Are we in a normal (calling) buffer and a REPL already exists?
   ((and doom-repl-buffer (buffer-live-p doom-repl-buffer))
    (doom/popup-buffer doom-repl-buffer))
   ;; Are we in a REPL buffer?
   ((and doom-repl-calling-buffer (buffer-live-p doom-repl-calling-buffer))
    (let ((target-buffer doom-repl-calling-buffer))
      (doom/popup-close)
      (switch-to-buffer target-buffer)))
   ;; Default case: we want to create a new REPL
   (t
    (let ((calling-buffer (current-buffer)))
      (repl-toggle-mode 1)
      (rtog/toggle-repl (if (use-region-p) 4))
      ;; We switch to the REPL buffer and set its callee.
      (setq-local doom-repl-calling-buffer calling-buffer)
      (let ((repl-buffer (current-buffer)))
        (with-current-buffer calling-buffer
          (setq-local doom-repl-buffer repl-buffer)))
      (when send-input (comint-send-input))))))

(provide 'defuns-repl)
;;; defuns-repl.el ends here
