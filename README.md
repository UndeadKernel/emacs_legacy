.emacs.d
========

My emacs configuration files. Take a look and see if there is anything interesting to you.

The file *.emacs* is not used, insted the file *.emacs.d/init.el* is used for bootstraping the configuration modules. This enables emacs to have all configuration files located within one directory only.

* Configuration Files
From within *.emacs.d/init.el* 7 configuration files are loaded.
  1. "conf"  - General configuration directives for emacs (window borders, toolbars, init messages, etc).
  2. "binds" - Custom keybord bindings.
  3. "extensions" - Tell emacs which emacs mode to lode for a particular file extension.
  4. "looks" - Things that specify the general look of emacs.
  5. "plugins" - Special configuration options for external plugins such as yasnippet and auto-correct, among others.
  6. "modes" - Configuration directives configuring the different modes used (python-mode, c-mode, js-mode, etc).
  7. "local" - Configuration options related to local preferences. This file contains directives that specify particular preferences for how code looks, how is code indented, etc.

* Features
  - Modular distribution of configuration files.
  - Modules and plugins independant from package managers; that is, everything is self contained and does not require installing other packages.
  - Comments everywhere (ok, maybe not everywhere).
  - Useful bindings
