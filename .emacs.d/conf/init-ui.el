;;; init-ui.el --- All settings for UI
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
;; Everything related to visual is here.

;;; Code:

;; theme options
(add-to-list 'custom-theme-load-path (concat *emacsd-directory* "/themes"))
(add-to-list 'load-path (concat *emacsd-directory* "/themes"))
(load-theme 'material t)

(setq
 ;; better startup
 inhibit-splash-screen t
 inhibit-startup-message t
 ;; show column number at bottom bar
 column-number-mode t
 ;; disable anoying beep
 ring-bell-function 'ignore
 ;; improve rendering performance
 redisplay-dont-pause t
 )

;; other options
(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-face-attribute 'default nil :height 130)

;; line numbers
(add-hook 'prog-mode-hook 'linum-mode)
(setq linum-format "%4d ")

;; Highlight current line
(global-hl-line-mode 1)

;; Undo and Redo windows
(winner-mode 1)

;; Open in fullscreen
(switch-fullscreen)

;; Transparency
(set-frame-parameter (selected-frame) 'alpha '(85 85))
(add-to-list 'default-frame-alist '(alpha 85 85))

(provide 'init-ui)
;;; init-ui.el ends here
