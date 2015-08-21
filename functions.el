;; Smooth scroll down
(defun my-down-scroll ()
  "Scroll down and center the screen"
  (interactive)
  (forward-line)
  (recenter))

;; Smooth scroll up
(defun my-up-scroll ()
  "Scroll up and center the screen"
  (interactive)
  (previous-line 1 1)
  (recenter))

;; Copy a paragraph and remove all extra spaces and line ends
(defun my-copy-paragraph (&optional beg end)
  "Save the current region (or line) to the `kill-ring' after stripping extra whitespace and new lines"
  (interactive
   (if (region-active-p)
       (list (region-beginning) (region-end))
     (list (line-beginning-position) (line-end-position))))
  (let ((my-text (buffer-substring-no-properties beg end)))
    (with-temp-buffer
      (insert my-text)
      (goto-char 1)
      (while (looking-at "[ \t\n]")
        (delete-char 1))
      (let ((fill-column 9333999))
        (fill-region (point-min) (point-max)))
      (kill-region (point-min) (point-max)))))
