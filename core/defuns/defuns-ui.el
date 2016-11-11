;;; defuns-ui.el

;;;###autoload
(defun doom/reset-theme ()
  (interactive)
  (doom/load-theme (or doom-current-theme doom-default-theme)))

;;;###autoload
(defun doom/load-font (font)
  (interactive)
  (set-frame-font font t)
  (setq doom-current-font font))

;;;###autoload
(defun doom/load-theme (theme &optional suppress-font)
  (interactive)
  (when doom-current-theme
    (disable-theme doom-current-theme))
  (load-theme theme t)
  (unless suppress-font
    (doom/load-font doom-current-font))
  (setq doom-current-theme theme))

;;;###autoload
(defun doom/show-as (how &optional pred)
  (let* ((beg (match-beginning 1))
         (end (match-end 1))
         (ok (or (not pred) (funcall pred beg end))))
    (when ok
      (compose-region beg end how 'decompose-region))
    nil))

;;;###autoload
(defun doom/imenu-list-quit ()
  (interactive)
  (quit-window)
  (mapc (lambda (b) (with-current-buffer b
                 (when imenu-list-minor-mode
                   (imenu-list-minor-mode -1))))
        (doom/get-visible-buffers (doom/get-real-buffers))))

(put 'doom-hide-mode-line-mode 'permanent-local t)
(put 'doom--mode-line 'permanent-local t)

(defvar doom-hide-mode-line-format nil
  "Format to use when `doom-hide-mode-line-mode' replaces the modeline")

(defvar-local doom--mode-line nil)
;;;###autoload
(define-minor-mode doom-hide-mode-line-mode
  "Minor mode to hide the mode-line in the current buffer."
  :init-value nil
  :global nil
  (if doom-hide-mode-line-mode
      (setq doom--mode-line mode-line-format
            mode-line-format doom-hide-mode-line-format)
    (setq mode-line-format doom--mode-line
          doom--mode-line doom-hide-mode-line-format)))

(provide 'defuns-ui)
;;; defuns-ui.el ends here
