;;;; project-init.el --- projectile config -*- coding: utf-8; lexical-binding: t; -*-

;;; Commentary:

;; My configurations for project-based development

;;; Code:

;; (use-package projectile
  ;; :ensure t
  ;; :config
  ;; (projectile-global-mode)
  ;; (setq projectile-enable-caching t))
 
;; 
;; (use-package treemacs
  ;; :ensure t
  ;; :config
  ;; (global-set-key (kbd "C-x M-0") #'treemacs-select-window))
;; 
;; (use-package treemacs-projectile
  ;; :after (treemacs-projectile)
  ;; :ensure t)
;; 
;; ;; todo highlighting
;; (use-package hl-todo
  ;; :hook (prog-mode . hl-todo-mode)
  ;; :config
  ;; (setq hl-todo-keyword-faces
	;; `(("TODO"       warning bold)
	  ;; ("FIXME"      error bold)
	  ;; ("DEPRECATED" font-lock-doc-face bold
	   ;; "NOTE"       success bold))))

(provide 'project-init)

;;; project-init.el ends here
