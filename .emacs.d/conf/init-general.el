;;; init-general.el --- Configurations for general purposes
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
;; This files contains settings and configurations for Emacs
;; itself. Like start screen, fullscreen mode, some Dired
;; configurations and etc.

;;; Code:

(setq
 ;; default directory
 default-directory *projects-directory*
 ;; disable backup files
 make-backup-files nil
 auto-save-default nil
 backup-inhibited t
 ;; If a frame alredy opened, use it!
 display-buffer-reuse-frames t
)

;; replace marked text when type
(delete-selection-mode 1)

;; Custom file for UI configurations
(setq custom-file (concat *emacsd-directory* "/custom.el"))
(load custom-file)

;; move cursor by camelCase
(subword-mode 1)

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; make indentation commands use space only
(setq-default indent-tabs-mode nil)

;; dired configurations
(put 'dired-find-file-other-buffer 'disabled t)
(setq dired-listing-switches "-alh")

;; whitespace display
(global-whitespace-mode)
(setq whitespace-global-modes
      '(not magit-mode git-commit-mode))
(setq whitespace-style '(face trailing tabs))

(provide 'init-general)
;;; init-general.el ends here
