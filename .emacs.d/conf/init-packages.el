;;; init-packages.el --- List and load of all needed packages
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
;; This file contains `my-packages' list and a `dolist' that intall
;; each package.
;;
;; Thanks to Renan Ranelli: https://github.com/rranelli/emacs-dotfiles

;;; Code:

(require 'package)
(package-initialize)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)

(defvar my-packages
  '(
    auto-package-update
    helm
    helm-projectile
    magit
    projectile
    )
  "A list of packages to be installed at application lauch.")

(setq packaged-contents-refreshed-p nil)
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (condition-case ex
  (package-install p)
  ('error (if packaged-contents-refreshed-p
      (error ex)
    (package-refresh-contents)
    (setq packaged-contents-refreshed-p t)
    (package-install p))))))

(provide 'init-packages)
;;; init-packages ends here
