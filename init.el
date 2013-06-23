(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(starter-kit
                      starter-kit-bindings
                      starter-kit-js
                      starter-kit-lisp
                      ;; Clojure & friends
                      clojure-mode
                      nrepl
                      rainbow-delimiters
                      midje-mode
                      ;; Project navigation
                      projectile
                      ack-and-a-half
                      ;; Misc.
                      markdown-mode
                      twilight-theme
                      hlinum)
  "A list of packages to ensure are installed at launch.")

;; Automaticaly install any missing packages
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Load the provided Clojure start kit configurations
(load (concat user-emacs-directory "clojure-starter-kit.el"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-warning-face ((t (:inherit nil :foreground "red" :background nil))))
 '(linum-highlight-face ((t (:inherit default :background "color-238" :foreground "white"))))
 '(show-paren-match ((((class color) (background dark)) (:inherit nil :foreground "red")))))


(load-library "iso-insert")

(define-key global-map (kbd "M-a") 'insert-a-umlaut)
(define-key global-map (kbd "M-o") 'insert-o-umlaut)
(define-key global-map (kbd "M-u") 'insert-u-umlaut)
(define-key global-map (kbd "M-A") 'insert-A-umlaut)
(define-key global-map (kbd "M-O") 'insert-O-umlaut)
(define-key global-map (kbd "M-U") 'insert-U-umlaut)

(set-face-attribute 'default nil :height 165)
(require 'color-theme)

(require 'midje-mode)
(add-hook 'clojure-mode-hook 'midje-mode)
