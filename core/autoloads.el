;;; autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads nil "defuns/defuns-auto-insert" "defuns/defuns-auto-insert.el"
;;;;;;  (22675 810 879971 205000))
;;; Generated autoloads from defuns/defuns-auto-insert.el

(autoload 'doom/auto-insert-snippet "defuns/defuns-auto-insert" "\
Auto insert a snippet of yasnippet into new file.

\(fn KEY &optional MODE PROJECT-ONLY)" t nil)

;;;***

;;;### (autoloads nil "defuns/defuns-buffers" "defuns/defuns-buffers.el"
;;;;;;  (22674 62926 119886 824000))
;;; Generated autoloads from defuns/defuns-buffers.el

(autoload 'doom/set-read-only-region "defuns/defuns-buffers" "\
Mark a region as read-only (http://stackoverflow.com/questions/7410125)

\(fn BEGIN END)" nil nil)

(autoload 'doom/set-region-writeable "defuns/defuns-buffers" "\
Undoes `doom/set-read-only-region' (http://stackoverflow.com/questions/7410125)

\(fn BEGIN END)" nil nil)

(autoload 'doom/get-buffers "defuns/defuns-buffers" "\
Get all buffers in the current project, in the current workgroup.

    If ALL-P is non-nil, get all buffers across all projects in current
workgroup.

\(fn &optional ALL-P)" nil nil)

(autoload 'doom/get-buffers-in-workgroup "defuns/defuns-buffers" "\
Get a list of buffers in current workgroup. Returns nil if workgroups2 isn't
loaded.

\(fn)" nil nil)

(autoload 'doom/get-buffer-names "defuns/defuns-buffers" "\
Get a list of names of buffers in the current workgroup, OR return the names
of the buffers in BUFFER-LIST.

\(fn &optional BUFFER-LIST)" nil nil)

(autoload 'doom/get-visible-windows "defuns/defuns-buffers" "\
Get a list of the visible windows in the current frame (that aren't popups),
OR return only the visible windows in WINDOW-LIST.

\(fn &optional WINDOW-LIST)" nil nil)

(autoload 'doom/get-visible-buffers "defuns/defuns-buffers" "\
Get a list of unburied buffers in the current project and workgroup, OR
return only the unburied buffers in BUFFER-LIST (a list of BUFFER-OR-NAMEs).

\(fn &optional BUFFER-LIST)" nil nil)

(autoload 'doom/get-buried-buffers "defuns/defuns-buffers" "\
Get a list of buried buffers in the current project and workgroup, OR return
only the buried buffers in BUFFER-LIST (a list of BUFFER-OR-NAMEs).

\(fn &optional BUFFER-LIST)" nil nil)

(autoload 'doom/get-matching-buffers "defuns/defuns-buffers" "\
Get a list of all buffers (in the current workgroup OR in BUFFER-LIST) that
match the regex PATTERN.

\(fn PATTERN &optional BUFFER-LIST)" nil nil)

(autoload 'doom/get-buffers-in-modes "defuns/defuns-buffers" "\
Get a list of all buffers (in the current workgroup OR in BUFFER-LIST) whose
`major-mode' is one of MODES.

\(fn MODES &optional BUFFER-LIST)" nil nil)

(autoload 'doom/get-real-buffers "defuns/defuns-buffers" "\
Get a list of all buffers (in the current workgroup OR in BUFFER-LIST) that
`doom/real-buffer-p' returns non-nil for.

\(fn &optional BUFFER-LIST)" nil nil)

(autoload 'doom/kill-real-buffer "defuns/defuns-buffers" "\
Kill buffer then switch to a real buffer. Only buries the buffer if it is
being displayed in another window.

NOTE: only buries scratch buffer.

See `doom/real-buffer-p' for what 'real' means.

\(fn &optional ARG)" t nil)

(autoload 'doom/kill-unreal-buffers "defuns/defuns-buffers" "\
Kill all buried buffers in current frame that match any of the rules in
`doom-unreal-buffers'.

\(fn)" t nil)

(autoload 'doom/kill-process-buffers "defuns/defuns-buffers" "\
Kill all buffers that represent running processes and aren't visible.

\(fn)" t nil)

(autoload 'doom/kill-matching-buffers "defuns/defuns-buffers" "\
Kill all buffers (in current workgroup OR in BUFFER-LIST) that match the
regex PATTERN.

\(fn PATTERN &optional BUFFER-LIST)" t nil)

(autoload 'doom/cycle-real-buffers "defuns/defuns-buffers" "\
Switch to the previous buffer, skipping over special buffers. If there's
nothing left, create a scratch buffer.

\(fn &optional N)" nil nil)

(autoload 'doom/real-buffer-p "defuns/defuns-buffers" "\
Returns whether BUFFER a 'real' buffer or not. Real means: a) it isn't a
popup (or temporary) window and b) it isn't a special buffer (e.g. scratch or
*messages* buffer).

\(fn &optional BUFFER)" nil nil)

(autoload 'doom/next-real-buffer "defuns/defuns-buffers" "\
Switch to the next real buffer, skipping special buffers. See
`doom/real-buffer-p'.

\(fn)" t nil)

(autoload 'doom/previous-real-buffer "defuns/defuns-buffers" "\
Switch to the previous real buffer, skipping special buffers. See
`doom/real-buffer-p'.

\(fn)" t nil)

(autoload 'doom/kill-all-buffers-do-not-remember "defuns/defuns-buffers" "\
Wipe the current workgroup session and save the blank state.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "defuns/defuns-company" "defuns/defuns-company.el"
;;;;;;  (22673 63134 551608 688000))
;;; Generated autoloads from defuns/defuns-company.el

(autoload 'doom/company-complete-common-or-complete-full "defuns/defuns-company" "\


\(fn)" t nil)

(autoload 'doom/company-whole-lines "defuns/defuns-company" "\


\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

(autoload 'doom/company-dict-or-keywords "defuns/defuns-company" "\


\(fn)" t nil)

(autoload 'doom/company-complete "defuns/defuns-company" "\
Bring up the completion popup. If there is only one result, auto-complete it.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "defuns/defuns-docs" "defuns/defuns-docs.el"
;;;;;;  (22673 63134 551608 688000))
;;; Generated autoloads from defuns/defuns-docs.el
 (autoload 'doom:docs-lookup "defuns-docs" nil t)

;;;***

;;;### (autoloads nil "defuns/defuns-editor" "defuns/defuns-editor.el"
;;;;;;  (22673 63134 551608 688000))
;;; Generated autoloads from defuns/defuns-editor.el

(autoload 'doom/mouse-drag-line "defuns/defuns-editor" "\


\(fn)" t nil)

(autoload 'doom/mouse-select-line "defuns/defuns-editor" "\


\(fn)" t nil)

(autoload 'doom/move-to-bol "defuns/defuns-editor" "\
Move the cursor to the indentation point or, if already there,
to the beginning of the line.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "defuns/defuns-flycheck" "defuns/defuns-flycheck.el"
;;;;;;  (22675 1773 529994 951000))
;;; Generated autoloads from defuns/defuns-flycheck.el

(autoload 'doom*flycheck-buffer "defuns/defuns-flycheck" "\


\(fn)" nil nil)

(autoload 'doom/flycheck-next-error "defuns/defuns-flycheck" "\


\(fn)" t nil)

(autoload 'doom/flycheck-previous-error "defuns/defuns-flycheck" "\


\(fn)" t nil)

(autoload 'doom/flycheck-errors "defuns/defuns-flycheck" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "defuns/defuns-git" "defuns/defuns-git.el"
;;;;;;  (22675 2210 930005 741000))
;;; Generated autoloads from defuns/defuns-git.el

(autoload 'doom/git-root "defuns/defuns-git" "\


\(fn)" nil nil)

(autoload 'doom/git-issues "defuns/defuns-git" "\
Open the github issues page for current repo.

\(fn)" t nil)

(autoload 'doom/git-magit "defuns/defuns-git" "\


\(fn)" t nil)

(autoload 'doom/git-browse "defuns/defuns-git" "\
Open the website for the current (or specified) version controlled FILE. If
BANG, then use hub to do it.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "defuns/defuns-highlight-indentation" "defuns/defuns-highlight-indentation.el"
;;;;;;  (22675 6113 383435 338000))
;;; Generated autoloads from defuns/defuns-highlight-indentation.el

(autoload 'doom/add-whitespace "defuns/defuns-highlight-indentation" "\
Maintain indentation whitespace in buffer. Used so that highlight-indentation will
display consistent guides. Whitespace is stripped out on save, so this doesn't affect the
end file.

\(fn &optional START END)" t nil)

(autoload 'doom*hl-indent-guess-offset "defuns/defuns-highlight-indentation" "\


\(fn)" nil nil)

;;;***

;;;### (autoloads nil "defuns/defuns-ivy" "defuns/defuns-ivy.el"
;;;;;;  (22675 6773 206784 948000))
;;; Generated autoloads from defuns/defuns-ivy.el

(autoload 'doom/ivy-switch-project-buffer "defuns/defuns-ivy" "\
Displays open buffers in current project and workspace. If ALL-P, then show
all open buffers.

\(fn &optional ALL-P)" t nil)

(autoload 'doom/ivy-switch-buffer "defuns/defuns-ivy" "\
Displays all open buffers, across projects and workspaces.

\(fn)" t nil)

(autoload 'doom/ivy-kill-ring "defuns/defuns-ivy" "\


\(fn)" t nil)

(autoload 'doom/ivy-tasks "defuns/defuns-ivy" "\


\(fn)" t nil)

(autoload 'doom*counsel-ag-function "defuns/defuns-ivy" "\
Advice to get rid of the character limit from `counsel-ag-function', which
interferes with my custom :ag ex command `doom:ivy-ag-search'.

\(fn STRING BASE-CMD EXTRA-AG-ARGS)" nil nil)

;;;***

;;;### (autoloads nil "defuns/defuns-neotree" "defuns/defuns-neotree.el"
;;;;;;  (22673 63134 551608 688000))
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
;;;;;;  (22673 62561 304927 880000))
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
;;;;;;  (22673 63134 551608 688000))
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

(autoload 'doom/popup-close-maybe "defuns/defuns-popups" "\
Close the current popup *if* its buffer doesn't have a :noesc rule in
`doom-popup-rules'.

\(fn)" t nil)

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
;;;;;;  (22673 62561 304927 880000))
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

;;;### (autoloads nil "defuns/defuns-ui" "defuns/defuns-ui.el" (22673
;;;;;;  63134 551608 688000))
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

;;;### (autoloads nil "defuns/defuns-window" "defuns/defuns-window.el"
;;;;;;  (22673 63134 551608 688000))
;;; Generated autoloads from defuns/defuns-window.el

(autoload 'doom/new-buffer "defuns/defuns-window" "\


\(fn)" t nil)

(autoload 'doom/new-frame "defuns/defuns-window" "\


\(fn)" t nil)

(autoload 'doom/close-frame "defuns/defuns-window" "\


\(fn)" t nil)

(autoload 'doom/move-buffer "defuns/defuns-window" "\


\(fn DIRECTION)" t nil)

(autoload 'doom/delete-window "defuns/defuns-window" "\


\(fn &optional WINDOW)" t nil)

(autoload 'doom/delete-other-windows "defuns/defuns-window" "\


\(fn &optional WINDOW)" t nil)

;;;***

;;;### (autoloads nil "defuns/defuns-workgroup" "defuns/defuns-workgroup.el"
;;;;;;  (22674 62926 119886 824000))
;;; Generated autoloads from defuns/defuns-workgroup.el

(autoload 'doom|wg-cleanup "defuns/defuns-workgroup" "\
Remove unsavable windows and buffers before we save the window
configuration.

\(fn)" nil nil)

(autoload 'doom/wg-projectile-switch-project "defuns/defuns-workgroup" "\


\(fn)" nil nil)

(autoload 'doom/workgroup-save "defuns/defuns-workgroup" "\


\(fn &optional SESSION-NAME)" t nil)

(autoload 'doom/workgroup-load "defuns/defuns-workgroup" "\


\(fn &optional SESSION-NAME)" t nil)

(autoload 'doom/clear-sessions "defuns/defuns-workgroup" "\
Delete all session files.

\(fn)" t nil)

(autoload 'doom/workgroup-new "defuns/defuns-workgroup" "\
Create a new workgroup. Ask to overwrite any workgroup named NAME.

\(fn NAME &optional SILENT)" t nil)

(autoload 'doom/workgroup-rename "defuns/defuns-workgroup" "\


\(fn &optional NEW-NAME)" t nil)

(autoload 'doom/workgroup-delete "defuns/defuns-workgroup" "\


\(fn &optional NAME)" t nil)

(autoload 'doom/kill-other-workgroups "defuns/defuns-workgroup" "\
Kill all other workgroups.

\(fn)" t nil)

(autoload 'doom/workgroup-display "defuns/defuns-workgroup" "\


\(fn &optional SUPPRESS-UPDATE RETURN-P MESSAGE)" t nil)

(autoload 'doom/workgroup-update-names "defuns/defuns-workgroup" "\


\(fn &optional WG)" nil nil)

(autoload 'doom/switch-to-workgroup-at-index "defuns/defuns-workgroup" "\


\(fn INDEX)" t nil)

(autoload 'doom/undo-window-change "defuns/defuns-workgroup" "\


\(fn)" t nil)

(autoload 'doom/redo-window-change "defuns/defuns-workgroup" "\


\(fn)" t nil)

(autoload 'doom/switch-to-workgroup-left "defuns/defuns-workgroup" "\


\(fn)" t nil)

(autoload 'doom/switch-to-workgroup-right "defuns/defuns-workgroup" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "defuns/defuns-yasnippet" "defuns/defuns-yasnippet.el"
;;;;;;  (22673 63134 551608 688000))
;;; Generated autoloads from defuns/defuns-yasnippet.el

(autoload 'doom|yas-before-expand "defuns/defuns-yasnippet" "\
Strip out the shitespace before a line selection.

\(fn)" nil nil)

(autoload 'doom|yas-after-expand "defuns/defuns-yasnippet" "\
Switch to insert mode when expanding a template via backtab, or go back to
normal mode if there are no fields.

\(fn)" nil nil)

(autoload 'doom/yas-expand-or-insert "defuns/defuns-yasnippet" "\
Expand or insert a snippet depending on whether there is an active mark
or not.

\(fn)" t nil)

(autoload 'doom/yas-goto-start-of-field "defuns/defuns-yasnippet" "\
Go to the beginning of a field.

\(fn)" t nil)

(autoload 'doom/yas-goto-end-of-field "defuns/defuns-yasnippet" "\


\(fn)" t nil)

(autoload 'doom/yas-backspace "defuns/defuns-yasnippet" "\
Prevents Yas from stepping on my toes when I use backspace.

\(fn &optional FIELD)" t nil)

(autoload 'doom/yas-delete "defuns/defuns-yasnippet" "\


\(fn &optional FIELD)" t nil)

(autoload 'doom/yas-clear-to-sof "defuns/defuns-yasnippet" "\


\(fn &optional FIELD)" t nil)

(autoload 'doom/yas-find-file "defuns/defuns-yasnippet" "\
Browse through snippets folder

\(fn)" t nil)

;;;***

;;;### (autoloads nil "defuns/macros-company" "defuns/macros-company.el"
;;;;;;  (22673 63134 551608 688000))
;;; Generated autoloads from defuns/macros-company.el

(autoload 'def-company-backend! "defuns/macros-company" "\
Register a company backend for a mode.

\(fn HOOKS BACKENDS)" nil t)

;;;***

;;;### (autoloads nil "defuns/macros-eval" "defuns/macros-eval.el"
;;;;;;  (22673 62561 304927 880000))
;;; Generated autoloads from defuns/macros-eval.el

(autoload 'def-builder! "defuns/macros-eval" "\
Register major/minor MODE with build COMMAND. If FILES are provided, do an additional
check to make sure they exist in the project root.

\(fn MODE COMMAND &optional BUILD-FILE)" nil t)

(autoload 'def-repl! "defuns/macros-eval" "\
Define a REPL for a mode.

\(fn MODE COMMAND)" nil t)

;;;***

;;;### (autoloads nil "defuns/macros-popups" "defuns/macros-popups.el"
;;;;;;  (22673 62561 304927 880000))
;;; Generated autoloads from defuns/macros-popups.el

(autoload 'def-popup! "defuns/macros-popups" "\


\(fn &rest PARAMS)" nil t)

;;;***

;;;### (autoloads nil "defuns/macros-yasnippet" "defuns/macros-yasnippet.el"
;;;;;;  (22673 62561 304927 880000))
;;; Generated autoloads from defuns/macros-yasnippet.el

(autoload 'def-yas-mode! "defuns/macros-yasnippet" "\
Register minor MODES in yasnippet.

\(fn MODE)" nil t)

;;;***

(provide 'autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; autoloads.el ends here
