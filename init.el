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
(set-face-attribute 'default nil :font "Fira Code-11")

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

;; corfu
(use-package corfu
  :hook (after-init . global-corfu-mode)
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0)
  (corfu-auto-prefix 2)
  )

(use-package diff-hl
  :hook ((after-init . global-diff-hl-mode)
	 ;; (after-init . diff-hl-flydiff-mode)
	 )
  )

(use-package quelpa-use-package
  :custom
  ;; disable all fetching of the MELPA repo
  (quelpa-checkout-melpa-p nil)
  ;; avoid updating the local clone of the MELPA git repo
  (quelpa-update-melpa-p nil)
  )

(use-package ligature
  :quelpa ((ligature :fetcher github
		     :repo "https://github.com/mickeynp/ligature.el"))
  :hook (after-init . global-ligature-mode)
  :config
  ;; Enable the www ligature in every possible major mode
  (ligature-set-ligatures 't '("www"))

  ;; Enable ligatures in programming modes
  (ligature-set-ligatures 'prog-mode '("www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\" "{-" "::"
                                       ":::" ":=" "!!" "!=" "!==" "-}" "----" "-->" "->" "->>"
                                       "-<" "-<<" "-~" "#{" "#[" "##" "###" "####" "#(" "#?" "#_"
                                       "#_(" ".-" ".=" ".." "..<" "..." "?=" "??" ";;" "/*" "/**"
                                       "/=" "/==" "/>" "//" "///" "&&" "||" "||=" "|=" "|>" "^=" "$>"
                                       "++" "+++" "+>" "=:=" "==" "===" "==>" "=>" "=>>" "<="
                                       "=<<" "=/=" ">-" ">=" ">=>" ">>" ">>-" ">>=" ">>>" "<*"
                                       "<*>" "<|" "<|>" "<$" "<$>" "<!--" "<-" "<--" "<->" "<+"
                                       "<+>" "<=" "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<=" "<<<"
                                       "<~" "<~~" "</" "</>" "~@" "~-" "~>" "~~" "~~>" "%%"))

  )
