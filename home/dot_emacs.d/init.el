;;;; .emacs.d/init.el -*- coding: utf-8; lexical-binding: t; -*-;
;; Author: Syed M. {mes0x01c}
;;                                                     
;;                       .oPYo.        .oPYo. .o        
;;                       8  .o8        8  .o8  8        
;; ooYoYo. .oPYo. .oPYo. 8 .P'8 `o  o' 8 .P'8  8 .oPYo. 
;; 8' 8  8 8oooo8 Yb..   8.d' 8  `bd'  8.d' 8  8 8    ' 
;; 8  8  8 8.       'Yb. 8o'  8  d'`b  8o'  8  8 8    . 
;; 8  8  8 `Yooo' `YooP' `YooP' o'  `o `YooP'  8 `YooP' 
;; ..:..:..:.....::.....::.....:..:::..:.....::..:.....:
;; :::::::::::::::::::::::::::::::::::::::::::::::::::::
;; :::::::::::::::::::::::::::::::::::::::::::::::::::::
;;

(require 'package)
(setq package-archives
      '(("elpa" . "https://elpa.gnu.org/packages/")
	("elpa-devel" . "https://elpa.gnu.org/devel/")
	("nongnu" . "https://elpa.nongnu.org/nongnu/")
	("melpa" . "https://melpa.org/packages/")))
(package-initialize)

;; Bootstrap 'use-package'
(eval-after-load 'gnutls
  '(add-to-list 'gnutls-trustfiles "/etc/ssl/cert.pem"))
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'bind-key)
(setq use-package-always-ensure t)

;; personal info
(setq user-full-name "Syed M.")

;; font
(add-to-list 'default-frame-alist '(font . "IosevkaTerm Nerd Font Mono"))
(set-face-attribute 'default t
		    :font "IosevkaTerm Nerd Font Mono"
		    :height 121)

;; font for Urdu text
(set-fontset-font t 'arabic (font-spec :family "Gulzar" :size 20))

;; Paths
(add-to-list 'load-path "~/.emacs.d/configs")

(setq ring-bell-function 'ignore)
(setq kill-whole-line t)

(setq backup-directory-alist `(("." . "~/.saves"))
      backup-by-copying-when-linked t)

;; diminish the modeline
(use-package diminish
  :ensure t)

;; my favorite theme :)
(load-theme 'modus-vivendi)

;; change color of marking regions to green 
(set-face-attribute 'region nil :foreground "#88E788")

;; configs
(require 'modeline-init)
(require 'keybinds-init)
(require 'org-init)
(require 'prog-init) 
;;(require 'project-init)

;; minibuffer management 
(use-package vertico
  :ensure t
  :config
  (setq vertico-cycle t)
  (setq vertico-resize nil)
  (vertico-mode 1))

(use-package marginalia
  :ensure t
  :bind (:map minibuffer-local-map
	      ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))

(use-package orderless
  :ensure t
  :config
  (setq completion-styles '(orderless basic)))

(use-package avy
  :defer t
  :bind
  (("C-:"   . avy-goto-char)
   ("C-'"   . avy-goto-char-2)
   ("M-g g" . avy-goto-line)
   ("M-g w" . avy-goto-word-1)
   ("M-g e" . avy-goto-word-0)))

(which-key-mode)
(diminish 'which-key-mode)
(recentf-mode 1)

;; spell-checking && dictionary
(setq-default ispell-program-name "aspell")
(setq dictionary-server "localhost")
(global-set-key (kbd "M-#") 'dictionary-search)

(setq view-read-only t)

;; crypto
(require 'epa-file)
(epa-file-enable)

;; functions
(defun my/display-startup-time ()
  (message
   "Emacs loaded in %s"
   (format (emacs-init-time))))

(add-hook 'emacs-startup-hook #'my/display-startup-time)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(anaconda-mode avy base16-theme cape corfu diminish flycheck ht
		   htmlize keycast marginalia markdown-mode meow
		   mood-line orderless org-journal org-modern org-node
		   org-superstar ts typescript-mode vertico yasnippet-snippets)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
