;;; defuns-quickrun.el

;;;; Code building ;;;;;;;;;;;;;;;;;;;;;;
;;;###autoload
(defvar doom--build-command '("make %s" . "Makefile"))
(make-variable-buffer-local 'doom--build-command)

;;;###autoload
(defun doom/build (arg)
  "Call a build command in the current directory. If ARG is nil this function calls
`recompile', otherwise it calls `compile' passing ARG as build command."
  (interactive "sBuild Arguments: ")
  (when (null doom--build-command)
    (user-error "No build command was set"))
  (let ((build-file (cdr doom--build-command))
        (build-cmd (car doom--build-command))
        (project-dir (doom/project-root)))
    (if (or (null build-file) (f-exists? (f-expand build-file project-dir)))
        (if (or (symbolp build-cmd) (functionp build-cmd))
            (if (commandp build-cmd)
                (call-interactively build-cmd)
              (funcall build-cmd))
          (let ((default-directory project-dir))
            (compile (format build-cmd (or arg "")))))
      (error "Could not build!"))))

;;;; Code running ;;;;;;;;;;;;;;;;;;;;;;
;;;###autoload
(defun doom/eval-buffer ()
  "Evaluate the whole buffer."
  (interactive)
  (cond ((eq major-mode 'emacs-lisp-mode)
         (doom/eval-region (point-min) (point-max)))
        (t (quickrun))))

;;;###autoload
(defun doom/eval-region (beg end)
  "Evaluate a region and, if large enough, prints its output to a popup buffer (if an
elisp buffer). Otherwise forward the region to Quickrun."
  (interactive "r")
  (cond ((eq major-mode 'emacs-lisp-mode)
         (require 'pp)
         (let ((result (eval (read (buffer-substring-no-properties beg end))))
               lines)
           (let ((buf (get-buffer-create "*eval*")))
             (with-current-buffer buf
               (read-only-mode -1)
               (setq-local scroll-margin 0)
               (erase-buffer)
               (prin1 result buf)
               (emacs-lisp-mode)
               (pp-buffer)
               (read-only-mode 1)
               (setq lines (count-lines (point-min) (point-max)))
               (goto-char (point-min))
               (when (< lines 5)
                 (message "%s" (buffer-substring (point-min) (point-max)))
                 (kill-buffer buf)))
             (unless (< lines 5)
               (doom/popup-buffer buf)))))
        (t (quickrun-region beg end))))

;;;###autoload
(defun doom/eval-region-and-replace (beg end)
  (interactive "r")
  (cond ((eq major-mode 'emacs-lisp-mode)
         (kill-region beg end)
         (condition-case nil
             (prin1 (eval (read (current-kill 0)))
                    (current-buffer))
           (error (message "Invalid expression")
                  (insert (current-kill 0)))))
        (t (quickrun-replace-region beg end))))

;;;###autoload
(defun doom*quickrun-close-popup (&optional _1 _2 _3 _4)
  "Allows us to re-run quickrun from inside the quickrun buffer."
  (awhen (get-buffer-window quickrun/buffer-name)
    (shut-up! (quickrun/kill-running-process))
    (doom/popup-close it nil)))

;;;###autoload
(defun doom|quickrun-after-run ()
  "Ensures window is scrolled to BOF"
  (with-selected-window (get-buffer-window quickrun/buffer-name)
    (goto-char (point-min))))

(provide 'defuns-quickrun)
;;; defuns-quickrun.el ends here
