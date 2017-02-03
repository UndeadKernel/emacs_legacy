;;; defuns-elisp.el

;;;###autoload
(defun doom/byte-compile ()
  (interactive)
  (byte-compile-file buffer-file-name))

(defsubst doom--ert-pre ()
  (save-buffer)
  (eval-buffer))

;;;###autoload
(defun doom/ert-run-test ()
  (interactive)
  (let (case-fold-search thing)
    (doom--ert-pre)
    (setq thing (thing-at-point 'defun t))
    (if thing
        (if (string-match "(ert-deftest \\([^ ]+\\)" thing)
            (ert-run-tests-interactively
             (substring thing (match-beginning 1) (match-end 1)))
          (user-error "Invalid test at point"))
      (user-error "No test found at point"))))

;;;###autoload
(defun doom/ert-rerun-test ()
  (interactive)
  (let (case-fold-search thing)
    (doom--ert-pre)
    (setq thing (car-safe ert--selector-history))
    (if thing
        (ert-run-tests-interactively thing)
      (message "No test found in history, looking for test at point")
      (doom/ert-run-test))))

;;;###autoload
(defun doom/ert-run-all-tests ()
  (interactive)
  (ert-delete-all-tests)
  (doom--ert-pre)
  (ert-run-tests-interactively t))

;;;###autoload
(defun doom/elisp-inf-ielm ()
  (ielm)
  (let ((buf (current-buffer)))
    (bury-buffer)
    (pop-to-buffer buf)))

(provide 'defuns-elisp)
;;; defuns-elisp.el ends here
