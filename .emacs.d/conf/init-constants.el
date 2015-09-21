;;; init-constants.el --- Constants used in other files
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
;; In this file I set all constants to use in other files, like
;; directories, files etc.

;;; Code:

(require 'lib/path)
(require 'lib/env)


;;; (Directories) ;;;
(defconst *user-home-directory*
  (getenv-or "HOME" (concat (expand-file-name "~") "/"))
  "Path to user home directory.")

(defconst *emacsd-directory*
  (path-join *user-home-directory* ".emacs.d")
  "Path to emacs.d directory.")

(defconst *projects-directory*
  (path-join *user-home-directory* "projects-source")
  "Path to my default project directory.")


(defconst *all-project-directories*
  (list
   *projects-directory*
   (path-join *projects-directory* "another-project-source") ;; you can duplicate or delete this line if you want
   )
  "List of all my project directories.")

(provide 'init-constants)
;;; init-constants.el ends here
