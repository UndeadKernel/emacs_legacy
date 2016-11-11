;;; core-vcs.el --- version control awareness

(use-package gitconfig-mode
  :mode ("/\\.?git/?config$" "/\\.gitmodules$")
  :init (add-hook 'gitconfig-mode-hook 'flyspell-mode))

(use-package gitignore-mode
  :mode ("/\\.gitignore$"
         "/\\.git/info/exclude$"
         "/git/ignore$"))

(use-package git-gutter
  :commands (git-gutter-mode doom/vcs-next-hunk doom/vcs-prev-hunk
             doom/vcs-show-hunk doom/vcs-stage-hunk doom/vcs-revert-hunk)
  :init
  (add-hook! (text-mode prog-mode conf-mode) 'git-gutter-mode)
  :config
  (require 'git-gutter-fringe)
  (def-popup! "^\\*git-gutter.+\\*$" :align below :size 15 :noselect t :regexp t)

  ;; colored fringe "bars"
  (define-fringe-bitmap 'git-gutter-fr:added
    [224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224]
    nil nil 'center)
  (define-fringe-bitmap 'git-gutter-fr:modified
    [224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224]
    nil nil 'center)
  (define-fringe-bitmap 'git-gutter-fr:deleted
    [0 0 0 0 0 0 0 0 0 0 0 0 0 128 192 224 240 248]
    nil nil 'center)

  ;; Refreshing git-gutter
  (add-hook 'focus-in-hook 'git-gutter:update-all-windows)

  (defalias 'doom/vcs-next-hunk    'git-gutter:next-hunk)
  (defalias 'doom/vcs-prev-hunk    'git-gutter:previous-hunk)
  (defalias 'doom/vcs-show-hunk    'git-gutter:popup-hunk)
  (defalias 'doom/vcs-stage-hunk   'git-gutter:stage-hunk)
  (defalias 'doom/vcs-revert-hunk  'git-gutter:revert-hunk))

(use-package git-messenger
  :commands git-messenger:popup-message
  :init (defvar git-messenger-map (make-sparse-keymap))
  :config
  (def-popup! "*git-messenger*" :align left :size 55 :select t)
  (setq git-messenger:show-detail t))

(use-package magit
  :commands magit-status)

(use-package browse-at-remote
  :commands (browse-at-remote/browse browse-at-remote/get-url))

(provide 'core-vcs)
;;; core-vcs.el ends here
