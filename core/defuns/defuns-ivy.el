;;; defuns-ivy.el

;; Show more information in ivy-switch-buffer; and only display
;; project/workgroup-relevant buffers.
(defun doom-ivy-get-buffers (&optional buffer-list)
  (let ((min-name 5)
        (min-mode 5)
        (proot (doom/project-root)))
    (mapcar
     (lambda (b) (format (format "%%-%ds %%-%ds %%s" min-name min-mode)
                    (nth 0 b)
                    (nth 1 b)
                    (or (nth 2 b) "")))
     (mapcar (lambda (b)
               (with-current-buffer b
                 (let ((buffer-name (buffer-name b))
                       (mode-name (symbol-name major-mode)))
                   (when (> (length buffer-name) min-name)
                     (setq min-name (+ (length buffer-name) 10)))
                   (when (> (length mode-name) min-mode)
                     (setq min-mode (+ (length mode-name) 3)))
                   (list
                    (concat
                     (propertize buffer-name
                                 'face (cond ((string-match-p "^ ?\\*" buffer-name)
                                              'font-lock-doc-face)
                                             ((not (string= proot (doom/project-root)))
                                              'font-lock-keyword-face)
                                             (buffer-read-only
                                              'error)))
                     (when (and buffer-file-name (buffer-modified-p))
                       (propertize "[+]" 'face 'mode-line-is-modified)))
                    (propertize mode-name 'face 'font-lock-constant-face)
                    (when buffer-file-name
                      (f-slash (abbreviate-file-name (f-dirname buffer-file-name))))))))
             (or buffer-list (doom/get-buffers))))))

(defun doom-ivy-select-buffer-action (buffer)
  (ivy--switch-buffer-action
   (substring buffer 0 (s-index-of "   " buffer))))

;;;###autoload
(defun doom/ivy-switch-project-buffer (&optional all-p)
  "Displays open buffers in current project and workspace. If ALL-P, then show
all open buffers."
  (interactive)
  (ivy-read (format "%s buffers: " (if all-p "All" "Project"))
            (doom-ivy-get-buffers (if all-p (buffer-list)))
            :matcher #'ivy--switch-buffer-matcher
            :action #'doom-ivy-select-buffer-action
            :keymap ivy-switch-buffer-map
            :caller 'doom/ivy-switch-project-buffer))

;;;###autoload
(defun doom/ivy-switch-buffer ()
  "Displays all open buffers, across projects and workspaces."
  (interactive)
  (doom/ivy-switch-project-buffer t))

;;;###autoload
(defun doom/ivy-kill-ring ()
  (interactive)
  (ivy-read "Kill ring:" (--filter (not (or (< (length it) 3)
                                            (string-match-p "\\`[\n[:blank:]]+\\'" it)))
                                   (remove-duplicates kill-ring :test 'equal))))

(provide 'defuns-ivy)
;;; defuns-ivy.el ends here
