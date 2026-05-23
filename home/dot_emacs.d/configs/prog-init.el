;;;; prog-init.el --- programming config -*- coding: utf-8; lexical-binding: t; -*-

;;; Commentary:

;; My configurations to LSPs and programming preferences

;;; Code:

(require 'eglot)

;; pair every parenthesis
(electric-pair-mode t)

(add-hook 'eglot-managed-mode-hook (lambda () (eglot-inlay-hints-mode -1)))
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; c/cpp
(setq c-default-style "stroustrup")
(setq c-basic-indent 4)
(setq c-basic-offset 4)

;; syntax checking
(use-package flycheck
  :diminish flycheck-mode
  :ensure t
  :init
  (global-flycheck-mode)
  :custom
  (flycheck-disabled-checkers '(emacs-lisp emacs-lisp-checkdoc)))

;; completion in region
(use-package corfu
  :ensure t
  :commands (corfu-mode global-corfu-mode)

  :hook ((prog-mode . corfu-mode)
	 (eshell-mode . corfu-mode))

  :custom
  (corfu-auto t)
  ;; Hide commands in M-x
  (read-extended-command-predicate #'command-completion-default-include-p)

  (tab-always-indent 'complete)

  (text-mode-ispell-word-completion nil)

  :bind (:map corfu-map
	      ("<escape>" .  corfu-quit)
	      ("TAB"      .  corfu-insert)
	      ("<tab>"    .  corfu-insert)
	      ("C-p"      .  corfu-previous))

  :config
  (global-corfu-mode))

(use-package cape
  :ensure t
  :bind (("C-c p d" . cape-dabbrev)
	 ("C-c p f" . cape-file)
	 ("C-c p i" . cape-dict))

  :init
  (add-hook 'completion-at-point-functions #'cape-dabbrev)
  (add-hook 'completion-at-point-functions #'cape-file)
  (add-hook 'completion-at-point-functions #'cape-elisp-block)
  (add-hook 'completion-at-point-functions #'cape-dict))
  ;;(add-hook 'completion-at-point-functions #'cape-keyword)
  
(use-package yasnippet-snippets
  :ensure t
  :after yasnippet)

(use-package yasnippet
  :diminish (yas-minor-mode)
  :ensure t
  :commands (yas-minor-mode
	     yas-global-mode)

  :hook
  (after-init . yas-global-mode)

  :custom
  (yas-snippet-revival nil))

(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)
(add-hook 'prog-mode-hook #'hl-line-mode)
(add-hook 'text-mode-hook #'hl-line-mode)

(diminish 'eldoc-mode)

(use-package typescript-mode
   :ensure t
   :config
   (add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
   (add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode)))

(provide 'prog-init)

;;; prog-init.el ends here
