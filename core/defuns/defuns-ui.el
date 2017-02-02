;;; defuns-ui.el

;;;###autoload
(defun doom/toggle-fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen (if (not (frame-parameter nil 'fullscreen)) 'fullboth)))

;;;###autoload
(defun doom/reset-theme ()
  (interactive)
  (doom/load-theme doom-ui-theme))

;;;###autoload
(defun doom/load-font (font)
  (interactive)
  (set-frame-font font t))

;;;###autoload
(defun doom/load-theme (theme)
  (interactive)
  (when doom-ui-theme
    (disable-theme doom-ui-theme))
  (load-theme theme t))

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
