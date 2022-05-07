;; -*- lexical-binding: t; -*-

;; settings
(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)
(setq visible-bell t)
(setq use-short-answers t)
(setq dired-kill-when-opening-new-dired-buffer t)

;; disabel useless mode
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; enable useful mode
(fido-vertical-mode 1)
(global-display-line-numbers-mode 1)
(electric-pair-mode 1)
(repeat-mode 1)
(recentf-mode 1)

;; keybindings
(global-set-key (kbd "C-x C-k") #'kill-this-buffer)
(global-set-key (kbd "C-/") #'undo-only)

;; set font
(set-face-attribute 'default nil :font "Consolas-11")

;; theme
;; (load-theme 'modus-vivendi) ; dark
(load-theme 'modus-operandi) ;light

;; custom-file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; package-archives
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
