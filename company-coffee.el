;;; company-coffee --- Emacs coffee completion

;; Author: Noah Peart <noah.v.peart@gmail.com>
;; URL: https://github.com/nverno/company-coffee
;; Package-Requires: ((company "0.8.0") (cl-lib "0.5.0"))
;; Copyright (C) 2016, Noah Peart, all rights reserved.
;; Created: 24 August 2016

;; This file is not part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 3, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.

;;; Commentary:

;; Emacs autocompletion backend for coffee scripts using `company-mode'.
;; Just adding the keywords for now.

;;; Code:

(require 'company)

(defgroup company-coffee nil
  "Company completion backend for ."
  :group 'company
  :prefix "company-coffee-")

(defcustom company-coffee-modes '(coffee-mode)
  "Modes to activate `company-coffee'."
  :group 'company-coffee
  :type 'sexp)

;; ------------------------------------------------------------
;; Internal

(defvar company-keywords-alist)
(defvar company-coffee-keywords
  '("and" "await" "break" "by" "catch" "continue"
    "class" "case" "const" "delete" "default" "do" "debugger"
    "defer" "else" "extends" "enum" "export" "__extends"
    "finally" "for" "function" "__hasProp"
    "if" "in" "instanceof" "import" "is" "isnt" "loop"
    "let" "new" "native" "not" "or" "own" "of"
    "return" "switch" "super" "try" "throw" "typeof" "then" "until"
    "unless" "var" "void" "while" "with" "when" "yield"))

;;;###autoload
(defun company-coffee-add-keywords ()
  "Add coffee keywords to `company-keywords-alist'."
  (setcdr
   (nthcdr (1- (length company-keywords-alist)) company-keywords-alist)
   `(,(append '(coffee-mode) company-coffee-keywords))))

;;;###autoload
(eval-after-load "coffee-mode"
  '(company-coffee-add-keywords))

(provide 'company-coffee)

;;; company-coffee.el ends here
