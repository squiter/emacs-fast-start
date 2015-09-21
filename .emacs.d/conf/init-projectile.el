;;; init-projectile.el --- Propjectile configuration
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
;; Thanks to Renan Ranelli for open project functions

;;; Code:

(require 'projectile)

(global-set-key (kbd "C-x f") 'helm-projectile)
(global-set-key (kbd "C-c p s a") 'helm-projectile-ack)

(projectile-global-mode)

;;; proojectile-helm
(setq projectile-completion-system 'helm)
(setq projectile-switch-project-action 'helm-projectile)
(setq helm-projectile-sources-list '(helm-source-projectile-buffers-list
				     helm-source-projectile-files-list))

;;
;;; Jumping between projects (Thanks to Renan Ranelli)
;;

;; variables
(defvar default-project-source *projects-directory*)

(defvar project-sources *all-project-directories*)

;; helm integration for opening projects
;; Jumping between projects
;;
(defvar rr/project-sources *all-project-directories*)

(defvar rr/default-file-regexps
  '("Gemfile$"
    "Readme"
    "README"))

(defun rr/helm-open-project ()
  "Bring up a Project search interface in helm."
  (interactive)
  (helm :sources '(rr/helm-open-project--source)
	:buffer "*helm-list-projects*"))

(defvar rr/helm-open-project--source
  '((name . "Open Project")
    (delayed)
    (candidates . rr/list-projects)
    (action . rr/open-project)))

(defun rr/list-projects ()
  "Lists all projects given project sources."
  (->> rr/project-sources
       (-filter 'file-exists-p)
       (-mapcat (lambda (dir) (directory-files dir t directory-files-no-dot-files-regexp)))))

(defun rr/open-project (path)
  "Open project available at PATH."
  ;; TODO: Add default file get.
  (let* ((candidates (-mapcat (lambda (d) (directory-files path t d)) rr/default-file-regexps))
         (elected (car candidates)))
    (find-file (or elected path))))

(global-set-key (kbd "C-c o") 'rr/helm-open-project)

(provide 'init-projectile)
;;; init-projectile.el ends here
