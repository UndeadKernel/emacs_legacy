;;; defuns-workgroup.el

;;;###autoload
(defun doom|wg-cleanup ()
  "Remove unsavable windows and buffers before we save the window
configuration."
  (let (doom-buffer-inhibit-refresh)
    (doom/popup-close-all)
    (when (and (featurep 'neotree) (neo-global--window-exists-p))
      (neotree-hide))))

;;;###autoload
(defun doom/wg-projectile-switch-project ()
  (let ((project-root (doom/project-root)))
    ;; TODO: check if there is another project with the same directory-file-name and if so
    ;; ... change the name of the new workgroup to something unique.
    (doom/workgroup-new (file-name-nondirectory (directory-file-name project-root)) t)
    (dired project-root)
    (when (featurep 'neotree)
      ;; If neotree is loaded, switch its root to the project root.
      (neotree-dir (project-root))))
  (doom/workgroup-display))

;;;###autoload
(defun doom/workgroup-save (&optional session-name)
  "Save the current workgroup session into a file."
  (interactive (list (read-string (format "Save name (%s): " (f-filename wg-session-file)))))
  (doom|wg-cleanup)
  (let ((session-file (if (not (s-blank? session-name))
                          (concat wg-workgroup-directory session-name)
                        wg-session-file)))
    (when (or (not (f-exists? session-file))
              (y-or-n-p (format "Session '%s' exists, overwrite?" (f-filename session-file))))
      (unless (wg-session-workgroup-list (wg-current-session))
        (wg-create-workgroup wg-first-wg-name))
      (wg-save-session-as session-file))))

;;;###autoload
(defun doom/workgroup-load (session-file &optional skip-save)
  (interactive (list (read-file-name "Load Workgroup File: " wg-workgroup-directory "last" t)))
  (doom|wg-cleanup)
  (if (s-equals? session-file (wg-session-file-name (wg-current-session)))
      (when (y-or-n-p (format "The session '%s' is already loaded, reload it and lose changes?" (f-filename session-file)))
        (wg-open-session session-file))
    (unless skip-save (wg-save-session))
    (wg-open-session session-file))
  (doom/workgroup-display t))

;;;###autoload
(defun doom/clear-sessions ()
  "Delete all session files."
  (interactive)
  (mapc 'delete-file (f-glob (expand-file-name "*" wg-workgroup-directory))))

;;;###autoload
(defun doom/workgroup-new (name &optional silent)
  "Create a new workgroup. Ask to overwrite any workgroup named NAME."
  (interactive (list (read-string "New Name: ")))
  (when (or (s-blank? name) (s-contains? " " name))
    (setq name (format "#%s" (1+ (length (wg-session-workgroup-list (wg-current-session t)))))))
  (let ((new-wg (wg-get-workgroup name t)))
    (when (and new-wg (y-or-n-p (format "'%s' already exists, replace?" name)))
      (wg-delete-workgroup new-wg)
      (setq new-wg nil))
    (setq new-wg (or new-wg (wg-make-and-add-workgroup name t)))
    (add-to-list 'doom-wg-names (wg-workgroup-uid new-wg))
    (wg-switch-to-workgroup new-wg))
  (unless silent
    (doom--workgroup-display (wg-previous-workgroup t)
                             (format "Created %s" name)
                             'success)))

;;;###autoload
(defun doom/workgroup-rename (&optional new-name)
  (interactive (list (read-string (format "New Name (%s): " (f-filename (doom/project-root)))
                                  nil nil (f-filename (doom/project-root)))))
  (let* ((wg (wg-current-workgroup))
         (wg-uid (wg-workgroup-uid wg))
         (old-name (wg-workgroup-name wg)))
    (unless new-name
      (user-error "You didn't enter a name"))
    (wg-rename-workgroup new-name wg)
    (add-to-list 'doom-wg-names wg-uid)
    (doom--workgroup-display wg (format "Renamed '%s'->'%s'" old-name new-name) 'success)))

;;;###autoload
(defun doom/workgroup-delete (&optional name)
  (interactive (list (read-string (format "Delete Workgroup (%s): " (wg-workgroup-name (wg-current-workgroup)))
                                  nil nil (wg-workgroup-name (wg-current-workgroup)))))
  (let* ((current-wg (wg-current-workgroup))
         (wg-name (or name (wg-workgroup-name current-wg))))
    (let ((wg (wg-get-workgroup name)))
      (setq doom-wg-names (delete (wg-workgroup-uid wg) doom-wg-names))
      (if (eq wg current-wg)
          (wg-kill-workgroup)
        (wg-delete-workgroup wg))
      (doom--workgroup-display nil (format "Deleted %s" wg-name) 'success))))

;;;###autoload
(defun doom/kill-other-workgroups ()
  "Kill all other workgroups."
  (interactive)
  (let (workgroup (wg-current-workgroup))
    (dolist (w (wg-session-workgroup-list (wg-current-session t)))
      (unless (wg-current-workgroup-p w)
        (wg-kill-workgroup w)))
    (doom--workgroup-display nil "Deleted all others" 'success)))

(defun doom--workgroup-display (&optional suppress-update message message-face)
  (message "%s%s" (doom/workgroup-display suppress-update t)
           (propertize message 'face message-face)))

;;;###autoload
(defun doom/workgroup-display (&optional suppress-update return-p message)
  (interactive)
  (awhen (wg-current-session t)
    (unless (eq suppress-update t)
      (doom/workgroup-update-names (if (wg-workgroup-p suppress-update) suppress-update)))
    (let ((output (wg-display-internal
                   (lambda (workgroup index)
                     (if (not workgroup) wg-nowg-string
                       (wg-element-display
                        workgroup
                        (format " [%d] %s " (1+ index) (wg-workgroup-name workgroup))
                        'wg-current-workgroup-p)))
                   (wg-session-workgroup-list it)))
          (session-file-name  (wg-session-file-name (wg-current-session))))
      (if return-p
          output
        (if session-file-name
            (message "%s: %s%s" (f-filename session-file-name) output (or message ""))
          (message "%s%s" output (or message "")))))))

;;;###autoload
(defun doom/workgroup-update-names (&optional wg)
  (let ((wg (or wg (wg-current-workgroup))))
    (unless (member (wg-workgroup-uid wg) doom-wg-names)
      (ignore-errors
        (let ((old-name (wg-workgroup-name wg))
              (new-name (f-filename (doom/project-root))))
          (unless (string= new-name old-name)
            (wg-rename-workgroup new-name wg)))))))

;;;###autoload
(defun doom/switch-to-workgroup-at-index (index)
  (interactive)
  (doom/workgroup-update-names)
  (let ((wg (nth index (wg-workgroup-list-or-error)))
        msg)
    (if wg
        (unless (eq wg (wg-current-workgroup t))
          (wg-switch-to-workgroup-at-index index))
      (setq msg (format "No tab #%s" (1+ index))))
    (doom/workgroup-display t nil msg)))

;;;###autoload
(defun doom/undo-window-change ()
  (interactive)
  (call-interactively (if (wg-current-workgroup t) 'wg-undo-wconfig-change 'winner-undo)))

;;;###autoload
(defun doom/redo-window-change ()
  (interactive)
  (call-interactively (if (wg-current-workgroup t) 'wg-redo-wconfig-change 'winner-redo)))

;;;###autoload
(defun doom/switch-to-workgroup-left ()
  (interactive)
  (wg-switch-to-workgroup-left)
  (doom/workgroup-display t))

;;;###autoload
(defun doom/switch-to-workgroup-right ()
  (interactive)
  (wg-switch-to-workgroup-right)
  (doom/workgroup-display t))

(defun doom/close-window-or-workgroup ()
  (interactive)
  (if (doom/popup-p)
      (doom/popup-close)
    (when (doom/kill-real-buffer)
      (if (and (one-window-p t)
               (> (length (wg-session-workgroup-list (wg-current-session))) 1))
          (if (string= (wg-workgroup-name (wg-current-workgroup)) wg-first-wg-name)
              (delete-window)
            (doom/workgroup-delete))
        (delete-window)))))

(provide 'defuns-workgroup)
;;; defuns-workgroup.el ends here
