;;; moving.el --- Extra commands for moving about a buffer.
;; Copyright 2000-2017 by Dave Pearson <davep@davep.org>

;; Author: Dave Pearson <davep@davep.org>
;; Version: 1.3
;; Keywords: convenience
;; URL: https://github.com/davep/moving.el

;; This program is free software: you can redistribute it and/or modify it
;; under the terms of the GNU General Public License as published by the
;; Free Software Foundation, either version 3 of the License, or (at your
;; option) any later version.
;;
;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
;; Public License for more details.
;;
;; You should have received a copy of the GNU General Public License along
;; with this program. If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; moving.el provides some extra commands for moving around a buffer.

;;; Code:

;;;###autoload
(defun moving-to-next-repeated-word ()
  "Find the the next repeated word."
  (interactive)
  (search-forward-regexp "\\(\\<\\w+\\>\\)\\(\\s-\\|\t\\|\n\\)+\\<\\1\\>"))

;;;###autoload
(defun moving-home ()
  "Move `point' towards \"home\" depending on context."
  (interactive)
  (cond ((bolp)
         (setf (point) (point-min)))
        ((<= (point) (save-excursion (back-to-indentation) (point)))
         (beginning-of-line))
        (t
         (back-to-indentation))))

;;;###autoload
(defun moving-end ()
  "Move `point' towards \"end\" depending on context."
  (interactive)
  (cond ((eolp)
         (setf (point) (point-max)))
        ((< (point) (save-excursion (back-to-indentation) (point)))
         (back-to-indentation))
        (t
         (end-of-line))))

;;;###autoload
(defun moving-backward-page (&optional count)
  "Call `backward-page' with COUNT then move to start of line."
  (interactive "p")
  (backward-page count)
  (beginning-of-line))

;;;###autoload
(defun moving-forward-page (&optional count)
  "Call `forward-page' with COUNT them move to start of line."
  (interactive "p")
  (forward-page count)
  (beginning-of-line))

(provide 'moving)

;;; moving.el ends here
