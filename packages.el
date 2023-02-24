;;; packages.el --- luyang-spaceline-placeholder layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2022 Sylvain Benner & Contributors
;;
;; Author: Luyang Liu <blackfish@Luyangs-MacBook-Pro.local>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `luyang-spaceline-placeholder-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `luyang-spaceline-placeholder/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `luyang-spaceline-placeholder/pre-init-PACKAGE' and/or
;;   `luyang-spaceline-placeholder/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst luyang-spaceline-placeholder-packages
  '())


(defun luyang-spaceline-placeholder ()
  (interactive)
  (message "Hello World"))

(defun display-box ()
  "Displays a dialog box in the middle of the screen."
  (interactive)
  (let ((message "Hello World"))
    (pop-to-buffer (get-buffer-create "*Dialog Box*"))
    (erase-buffer)
    (insert message)
    (beginning-of-buffer)
    (local-set-key (kbd "q") 'kill-this-buffer)
    (local-set-key (kbd "Q") 'kill-this-buffer)
    (local-set-key (kbd "RET") 'kill-this-buffer)
    (center-window)
    (read-only-mode -1)))

(defun change-mode-line()
(setq-default mode-line-format
              '((:eval
                 (cond
                  (buffer-read-only
                   (propertize " ⚑ "
                               'face '(:foreground "red" :weight 'bold)
                               'help-echo "buffer is read-only!!!"))
                  ((buffer-modified-p)
                   (propertize " ☡ "
                               'face '(:foreground "orange")
                               'help-echo "buffer modified."))))
                (:eval (if (memq (buffer-local-value 'major-mode (current-buffer))
                                 '(ruby-mode enh-ruby-mode))
                           (propertize "Ruby" 'face '(:foreground "green"))
                         (propertize "Not Ruby" 'face '(:foreground "orange"))))))
)
