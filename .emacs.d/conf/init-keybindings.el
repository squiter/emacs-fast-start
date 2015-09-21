;;; init-keybindings.el --- Keybindings
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
;; This file doesn't contain package specific keybindings

;;; Code:
(global-set-key (kbd "C-<return>") 'custom/insert-new-line)
(global-set-key (kbd "C-a") 'custom/smart-move-beginning-of-line)
(global-set-key (kbd "C-c d") 'custom/duplicate-current-line-or-region)
(global-set-key (kbd "C-c e") 'eval-buffer)
(global-set-key (kbd "C-x -") 'hsplit-last-buffer)
(global-set-key (kbd "C-x |") 'vsplit-last-buffer)
(global-set-key (kbd "C-x =") 'swap-buffers-in-windows)
(global-set-key (kbd "C-x C-k") 'delete-current-buffer-file)
(global-set-key (kbd "C-x C-r") 'rename-current-buffer-file)
(global-set-key (kbd "C-c /") 'custom/toggle-line-comment)
(global-set-key (kbd "C-c j") 'join-line)
(global-set-key (kbd "C-c w") 'whitespace-cleanup)
(global-set-key (kbd "C-c i") 'indent-buffer)

(provide 'init-keybindings)
;;; init-keybindings.el ends here
