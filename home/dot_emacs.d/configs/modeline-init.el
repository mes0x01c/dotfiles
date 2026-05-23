;;;; smh-modeline.el --- modeline config -*- coding: utf-8; lexical-binding: t; -*-

;;; Commentary:

;; Configure vanilla modeline

;;; Code:

;;
;; 

(set-face-attribute 'mode-line nil
		    :background "Black"
		    :foreground "White"
		    :font "DejaVu Sans Mono-11"
		    :overline nil
		    :underline nil)

(set-face-attribute 'mode-line-inactive nil
		    :background "#191816"
		    :foreground "#4b4944"
		    :font "DejaVu Sans Mono-11"
		    :overline nil
		    :underline nil)

(use-package mood-line
  :config
  (mood-line-mode)

  :custom
  (mood-line-glyph-alist mood-line-glyphs-fira-code))

(setq mood-line-format
      (mood-line-defformat
       :left
       (((mood-line-segment-buffer-status) . " ")
	((mood-line-segment-buffer-name)   . " : ")
	(mood-line-segment-major-mode))
       :right
       (((mood-line-segment-scroll)             . " ")
	((mood-line-segment-cursor-position)    . "  ")
	((when (mood-line-segment-checker) "|") . "  ")
	((mood-line-segment-checker)            . "  "))))

(provide 'modeline-init)

;;; modeline-init.el ends here
