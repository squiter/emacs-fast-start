;; -*- mode: emacs-lisp -*-

;;; .emacs --- The init file of emacs configuration
;;
;; Copyright (C) 2015 Brunno dos Santos <emacs at brunno dot me>
;;
;; Author: Brunno dos Santos @squiter
;; URL: http://github.com/squiter/emacs-fast-start
;;
;; This file is NOT part of GNU Emacs.
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; See <http://www.gnu.org/licenses/> for a copy of the GNU General
;; Public License.
;;
;;; Commentary:
;;
;; This file contains only the `requires' needed to load your configs

;;; Code:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path (expand-file-name "conf" user-emacs-directory))

(require 'init-packages)
(require 'init-simple-packages)

(require 'init-constants)
(require 'init-general)
(require 'init-custom-functions)
(require 'init-ui)
(require 'init-keybindings)
(require 'init-mac-switch-meta)

;; init my packages configurations
(require 'init-helm)
(require 'init-magit)
(require 'init-projectile)
(require 'init-eshell)

;;; .emacs ends here
