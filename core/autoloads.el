;;; autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads nil "defuns/defuns-buffers" "defuns/defuns-buffers.el"
;;;;;;  (22509 36029 576249 86000))
;;; Generated autoloads from defuns/defuns-buffers.el

(autoload 'doom/set-read-only-region "defuns/defuns-buffers" "\
See http://stackoverflow.com/questions/7410125

\(fn BEGIN END)" nil nil)

(autoload 'doom/set-region-writeable "defuns/defuns-buffers" "\
See http://stackoverflow.com/questions/7410125

\(fn BEGIN END)" nil nil)

(autoload 'doom/get-buffers "defuns/defuns-buffers" "\
Get all buffers in the current workgroup.

    If PROJECT-P is non-nil, get all buffers in current workgroup
    If both are non-nil, get all project buffers across all workgroups

\(fn &optional ALL-P)" nil nil)

(autoload 'doom/get-buffers-in-workgroup "defuns/defuns-buffers" "\


\(fn)" nil nil)

(autoload 'doom/get-buffer-names "defuns/defuns-buffers" "\


\(fn &optional BUFFER-LIST)" nil nil)

(autoload 'doom/get-visible-windows "defuns/defuns-buffers" "\
Get a list of the visible windows in the current frame (that aren't popups).

\(fn &optional WINDOW-LIST)" nil nil)

(autoload 'doom/get-visible-buffers "defuns/defuns-buffers" "\
Get a list of unburied buffers in the current project and workgroup.

\(fn &optional BUFFER-LIST)" nil nil)

(autoload 'doom/get-buried-buffers "defuns/defuns-buffers" "\
Get a list of buried buffers in the current project and workgroup.

\(fn &optional BUFFER-LIST)" nil nil)

(autoload 'doom/get-matching-buffers "defuns/defuns-buffers" "\
Get a list of buffers that match the pattern

\(fn PATTERN &optional BUFFER-LIST)" nil nil)

(autoload 'doom/get-buffers-in-modes "defuns/defuns-buffers" "\
Get a list of buffers whose major-mode is one of MODES

\(fn MODES &optional BUFFER-LIST)" nil nil)

(autoload 'doom/get-real-buffers "defuns/defuns-buffers" "\


\(fn &optional BUFFER-LIST)" nil nil)

(autoload 'doom/kill-real-buffer "defuns/defuns-buffers" "\
Kill buffer (but only bury scratch buffer), then switch to a real buffer. Only buries
the buffer if it is being displayed in another window.

\(fn &optional ARG)" t nil)

(autoload 'doom/kill-unreal-buffers "defuns/defuns-buffers" "\
Kill all buried, unreal buffers in current frame. See `doom-unreal-buffers'

\(fn)" t nil)

(autoload 'doom/kill-process-buffers "defuns/defuns-buffers" "\
Kill all buffers that represent running processes and aren't visible.

\(fn)" t nil)

(autoload 'doom/kill-matching-buffers "defuns/defuns-buffers" "\


\(fn REGEXP &optional BUFFER-LIST)" t nil)

(autoload 'doom/cycle-real-buffers "defuns/defuns-buffers" "\
Switch to the previous buffer and avoid special buffers. If there's nothing
left, create a scratch buffer.

\(fn &optional N)" nil nil)

(autoload 'doom/real-buffer-p "defuns/defuns-buffers" "\
Returns whether BUFFER a 'real' buffer or not. Real means it isn't a popup,
temporary, scratch or special buffer.

\(fn &optional BUFFER)" nil nil)

(autoload 'doom/next-real-buffer "defuns/defuns-buffers" "\
Switch to the next buffer and avoid special buffers.

\(fn)" t nil)

(autoload 'doom/previous-real-buffer "defuns/defuns-buffers" "\
Switch to the previous buffer and avoid special buffers.

\(fn)" t nil)

(autoload 'doom/kill-all-buffers-do-not-remember "defuns/defuns-buffers" "\
Kill all buffers so that workgroups2 will wipe its current session.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "defuns/defuns-neotree" "defuns/defuns-neotree.el"
;;;;;;  (22514 43697 265247 587000))
;;; Generated autoloads from defuns/defuns-neotree.el

(autoload 'doom/neotree "defuns/defuns-neotree" "\
Toggle the neotree window

\(fn)" t nil)

(autoload 'doom/neotree-save "defuns/defuns-neotree" "\


\(fn &rest BODY)" nil t)

(autoload 'doom|neotree-close-on-window-change "defuns/defuns-neotree" "\
Close neotree to prevent ensuing mindow buggery.

\(fn &rest _)" nil nil)

(autoload 'doom*save-neotree "defuns/defuns-neotree" "\
Prevents messing up the neotree buffer on window changes

\(fn ORIG-FUN &rest ARGS)" nil nil)

(autoload 'doom*neotree-create-node "defuns/defuns-neotree" "\
Don't ask for confirmation when creating files

\(fn ORIG-FUN &rest ARGS)" nil nil)

;;;***

;;;### (autoloads nil "defuns/defuns-nlinum" "defuns/defuns-nlinum.el"
;;;;;;  (22517 1547 669411 885000))
;;; Generated autoloads from defuns/defuns-nlinum.el

(autoload 'doom/nlinum-toggle "defuns/defuns-nlinum" "\


\(fn)" t nil)

(autoload 'doom|nlinum-enable "defuns/defuns-nlinum" "\


\(fn &rest _)" nil nil)

(autoload 'doom|nlinum-disable "defuns/defuns-nlinum" "\


\(fn &rest _)" nil nil)

(autoload 'doom|nlinum-hl-line "defuns/defuns-nlinum" "\
Highlight line number

\(fn &rest _)" nil nil)

;;;***

;;;### (autoloads nil "defuns/defuns-popups" "defuns/defuns-popups.el"
;;;;;;  (22506 58213 386250 687000))
;;; Generated autoloads from defuns/defuns-popups.el

(autoload 'doom*popup-window-move "defuns/defuns-popups" "\


\(fn ORIG-FN &rest ARGS)" nil nil)

(autoload 'doom/popup-p "defuns/defuns-popups" "\
Whether WINDOW is a popup window or not. If WINDOW is nil, use current
window. Returns nil or the popup window.

\(fn &optional WINDOW)" nil nil)

(autoload 'doom/popups-p "defuns/defuns-popups" "\
Whether there is a popup window open and alive somewhere.

\(fn)" nil nil)

(autoload 'doom/popup-save "defuns/defuns-popups" "\
Close popups before BODY and restore them afterwards.

\(fn &rest BODY)" nil t)

(autoload 'doom/popup-buffer "defuns/defuns-popups" "\
Display BUFFER in a shackle popup.

\(fn BUFFER &optional PLIST)" nil nil)

(autoload 'doom/popup-close "defuns/defuns-popups" "\
Find and close the currently active popup (if available).

\(fn &optional WINDOW DONT-KILL DONT-REDRAW)" t nil)

(autoload 'doom/popup-close-all "defuns/defuns-popups" "\
Closes all popups (kill them if DONT-KILL-BUFFERS is non-nil). Then redraw
the display (unless DONT-REDRAW is non-nil).

\(fn &optional DONT-KILL DONT-REDRAW)" t nil)

(autoload 'doom/popup-last-buffer "defuns/defuns-popups" "\
Restore the last popup.

\(fn)" t nil)

(autoload 'doom/popup-messages "defuns/defuns-popups" "\
Pop up the messages buffer.

\(fn)" t nil)

(autoload 'doom*popup-init "defuns/defuns-popups" "\
Enable `doom-popup-mode' in every popup window and returns the window.

\(fn ORIG-FN &rest ARGS)" nil nil)

(autoload 'doom*save-popup "defuns/defuns-popups" "\
Prevents messing up a popup buffer on window changes

\(fn ORIG-FUN &rest ARGS)" nil nil)

(autoload 'doom-popup-mode "defuns/defuns-popups" "\
Pop ups

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "defuns/defuns-projectile" "defuns/defuns-projectile.el"
;;;;;;  (22514 23701 862338 937000))
;;; Generated autoloads from defuns/defuns-projectile.el

(autoload 'doom/project-root "defuns/defuns-projectile" "\
Get the path to the root of your project.

\(fn &optional STRICT-P)" nil nil)

(autoload 'doom/project-has-files "defuns/defuns-projectile" "\
Return non-nil if FILES exist in the project root.

\(fn FILES &optional ROOT)" nil nil)

(autoload 'doom/project-p "defuns/defuns-projectile" "\
Whether or not this buffer is currently in a project or not.

\(fn &optional STRICT-P)" nil nil)

(defalias 'doom/project-name 'projectile-project-name)

;;;***

;;;### (autoloads nil "defuns/defuns-ui" "defuns/defuns-ui.el" (22514
;;;;;;  27690 656750 852000))
;;; Generated autoloads from defuns/defuns-ui.el

(autoload 'doom/reset-theme "defuns/defuns-ui" "\


\(fn)" t nil)

(autoload 'doom/load-font "defuns/defuns-ui" "\


\(fn FONT)" t nil)

(autoload 'doom/load-theme "defuns/defuns-ui" "\


\(fn THEME &optional SUPPRESS-FONT)" t nil)

(autoload 'doom/show-as "defuns/defuns-ui" "\


\(fn HOW &optional PRED)" nil nil)

(autoload 'doom/imenu-list-quit "defuns/defuns-ui" "\


\(fn)" t nil)

(autoload 'doom-hide-mode-line-mode "defuns/defuns-ui" "\
Minor mode to hide the mode-line in the current buffer.

\(fn &optional ARG)" t nil)

;;;***

(provide 'autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; autoloads.el ends here
