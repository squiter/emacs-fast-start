;;; init-custom-functions.el --- Custom functions
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

(defun custom/insert-new-line ()
  "Insert new line without breaking the current one."
  (interactive)
  (move-end-of-line 1)
  (newline-and-indent))

(defun custom/toggle-line-comment ()
  "Comment or uncomment current line or the ones covered by a marked region."
  (interactive)
  (let
   ((beg (car (custom/get-region-positions)))
    (end (cdr (custom/get-region-positions))))
   (comment-or-uncomment-region beg end)))

(defun custom/get-region-positions ()
  "Return a dotted-pair (BEG . END) with regions's beginning and ending positions."
  (interactive)
  (save-excursion
    (let (beg end)
      (if (and mark-active (> (point) (mark)))
          (exchange-point-and-mark))
      (setq beg (line-beginning-position))
      (if mark-active
          (exchange-point-and-mark))
      (setq end (line-end-position))
      (cons beg end))))

(defun custom/smart-move-beginning-of-line ()
  "Move to beginning of line or to beginning of indentation depending on POINT."
  (interactive)
  (if (= (point) (line-beginning-position))
      (back-to-indentation)
    (move-beginning-of-line nil)))

(defun custom/duplicate-current-line-or-region (arg)
  "Duplicates the current line or those covered by region ARG times."
  (interactive "p")
  (let (beg end exit-point)
    (if (and mark-active (> (point) (mark)))
        (exchange-point-and-mark)))
  (setq beg (line-beginning-position))
  (if mark-active
      (exchange-point-and-mark))
  (setq end (line-end-position))
  (setq exit-point end)
  (let ((region (buffer-substring-no-properties beg end)))
    (dotimes (_ arg)
      (goto-char end)
      (newline)
      (insert region)
      (setq end (point)))
    (goto-char exit-point)
    (next-line)
    (back-to-indentation)))

;; Indent all buffer
(defun indent-buffer ()
  "Indent the currently visited buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun hsplit-last-buffer ()
  "Ex: - Horizontally split window showing last buffer."
  (interactive)
  (split-window-vertically)
  (other-window 1 nil)
  (switch-to-next-buffer))

(defun vsplit-last-buffer ()
  "Ex: | Vertically split window showing last buffer."
  (interactive)
  (split-window-horizontally)
  (other-window 1 nil)
  (switch-to-next-buffer))

(defun swap-buffers-in-windows ()
  "Put the buffer from the selected window in next window, and vice versa."
  (interactive)
  (let* ((this (selected-window))
	 (other (next-window))
	 (this-buffer (window-buffer this))
	 (other-buffer (window-buffer other)))
    (set-window-buffer other this-buffer)
    (set-window-buffer this other-buffer)))

(defun switch-fullscreen nil
  "Switch to fullscreen.  Works nine in OSX."
  (interactive)
  (let* ((modes '(nil fullboth fullwidth fullheight))
         (cm (cdr (assoc 'fullscreen (frame-parameters) ) ) )
         (next (cadr (member cm modes) ) ) )
    (modify-frame-parameters
     (selected-frame)
     (list (cons 'fullscreen next)))))

(defun delete-current-buffer-file ()
  "Remove file connected to current buffer and kill buffer."
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer))
        (name (buffer-name)))
    (if (not (and filename (file-exists-p filename)))
        (ido-kill-buffer)
      (when (yes-or-no-p "Are you sure you want to remove this file? ")
        (delete-file filename)
        (kill-buffer buffer)
        (message "File '%s' successfully removed" filename)))))

(defun rename-current-buffer-file ()
  "Rename current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))

(defun camelcase-to-snakecase ()
  "Switch thisName to this-name."
  (interactive)
  (save-excursion
    (let ((bounds (bounds-of-thing-at-point 'word)))
      (replace-regexp "\\([A-Z]\\)" "_\\1" nil
                      (1+ (car bounds)) (cdr bounds))
      (downcase-region (car bounds) (cdr bounds)))))

(provide 'init-custom-functions)
;;; init-custom-functions.el ends here
