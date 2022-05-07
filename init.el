;; -*- lexical-binding: t; -*-

;; font
(set-face-attribute 'default nil :font "Consolas-11")

;; (load-theme 'modus-vivendi)
(load-theme 'modus-operandi)
(menu-bar-mode -1)
(tool-bar-mode -1)
(setq visible-bell t)
(setq inhibit-startup-screen t)
(global-display-line-numbers-mode 1)

(fido-vertical-mode 1)
(electric-pair-mode 1)
(setq use-short-answers t)
(setq dired-kill-when-opening-new-dired-buffer t)

(global-set-key (kbd "C-x C-k") #'kill-this-buffer)

(repeat-mode 1)

(recentf-mode 1)
