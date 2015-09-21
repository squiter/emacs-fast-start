;;; init-eshell.el --- Emcas Shell configurations
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

;;; Code:

(require 'eshell)

(defun custom/bash-command (&rest cmd)
  "Run CMD as if you were in a bash shell instead of Eshell."
  (insert (format "bash -c 'source ~/.bash_profile; cd %s; %s'"
                  (eshell/pwd)
                  (mapconcat 'identity (car cmd) " ")))
  (eshell-send-input))

(defun custom/projectile-eshell ()
  "Open an eshell buffer at project's root directory."
  (interactive)
  (let ((shell-dir (projectile-project-root))
        (shell-title (format "*eshell [%s]*" (projectile-project-name))))
    (other-window 1)
    (if (get-buffer shell-title)
        (switch-to-buffer (get-buffer shell-title))
      (switch-to-buffer (generate-new-buffer shell-title))
      (eshell-mode)
      (goto-char (point-max))
      (insert (format "cd %s" shell-dir))
      (eshell-send-input))))

(global-set-key (kbd "C-c C-t") 'custom/projectile-eshell)

;;; Emacs Shell Alias
(require 'em-alias)
(add-to-list 'eshell-command-aliases-list (list "ls" "ls -l"))

(provide 'init-eshell)
;;; init-eshell.el ends here
