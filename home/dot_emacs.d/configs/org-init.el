;;;; org-init.el --- org config -*- coding: utf-8; lexical-binding: t; -*-

;;; Commentary:

;; My configurations to org-mode

;;; Code:

(setq org-directory "~/Dropbox/org")
(setq org-agenda-files '("~/Dropbox/org/todo.org"))
(setq org-todo-keywords '((sequence "TODO(t!)" "NEXT(n)" "|" "DONE(d!)" "CANC(c!)")))
(setq org-log-into-drawer t)
(setq org-return-follows-link t)
(setq org-hide-emphasis-markers t)
(setq org-agenda-start-on-weekday nil)
(setq org-agenda-start-with-log-mode t)
(setq line-spacing 0.2)

;; Treat txt files as org files
(add-to-list 'auto-mode-alist '("\\.txt\\'" . org-mode))

;; Habits
;; note: look at `org-habit-get-faces' for necessary info
(require 'org-habit)
(setq org-habit-graph-column 75)

(setq org-capture-templates
      `(("t" "Todo"
	 entry (file "~/Dropbox/org/todo.org") "* TODO %?\n" :empty-lines 1)

	("n" "Note"
	 entry (file "~/Dropbox/org/sticky.org") ,(concat "* %?" "\n%U") :empty-lines 1)

	("e" "Capture entry into ID node"
	 entry (function org-node-capture-target) "* %?")))

(defun my/modify-org-done-face ()
  (setq org-fontify-done-headline t)
  (set-face-attribute 'org-done nil
		      :strike-through t))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (C      . t)
   (java   . t)
   (latex  . t)
   (shell  . t)))

(setq org-confirm-babel-evaluate nil)

(plist-put org-format-latex-options :scale 1.5)

;; org-to-markdown
(require 'ox-md)

(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

;; (use-package org-modern
;;   :defer t
;;   :hook (org-mode . org-modern-mode)
;;   :custom
;;   (org-modern-star '("●" "○" "•" "◦"))
;;   (org-modern-todo nil))

(use-package org-journal
  :ensure t
  :defer t
  :init
  (setq org-journal-prefix-key "C-c j ")
  :config
  (setq org-journal-dir "~/Dropbox/org/journal/"
	org-journal-date-format "%A, %d %B %Y"))

;; hooks
(eval-after-load "org"
  (add-hook 'org-add-hook 'my/modify-org-done-face))

(provide 'org-init)

;;; org-init.el ends here
