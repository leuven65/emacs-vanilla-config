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
(global-set-key (kbd "C-x C-S-e") #'pp-macroexpand-last-sexp)

;; set font
(set-face-attribute 'default nil :font "Cascadia Code-11")
(set-face-attribute 'default nil :font "Fira Code-11")
;; (set-face-attribute 'default nil :font "Consolas-12")

;; theme
(load-theme 'modus-vivendi) ; dark
;; (load-theme 'modus-operandi) ;light

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
  ;; Enable the "www" ligature in every possible major mode
  (ligature-set-ligatures 't '("www"))
  ;; ;; Enable traditional ligature support in eww-mode, if the
  ;; ;; `variable-pitch' face supports it
  ;; (ligature-set-ligatures 'eww-mode '("ff" "fi" "ffi"))
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

(use-package system-packages
  :custom
  (system-packages-use-sudo nil)
  )

(setq ispell-program-name "aspell")
(setq ispell-extra-args '("--sug-mode=ultra" "--lang=en_US" "--run-together"))

(use-package pdf-tools
  :hook (after-init . pdf-loader-install)
  )

(use-package c-ts-mode
  :custom
  (c-ts-mode-indent-style #'my-c-ts-mode-indent-style)
  :init
  (defun my-c-ts-mode-indent-style (&optional mode)
    (let* ((mode (or mode (if (derived-mode-p 'c-ts-mode) 'c 'cpp)))
	   (base-style (alist-get 'bsd (c-ts-mode--indent-styles mode))))
      (append '(
		;; ((node-is "case") parent-bol c-ts-mode-indent-offset)
		;; ((parent-is "argument_list") parent-bol c-ts-mode-indent-offset)
		)
	      base-style)
      )
    )
  )

(use-package clang-format
  )

;; some optimize 
;; (when (and company-candidates-cache
;; 	   (not (assoc prefix company-candidates-cache)))
;;   (let (prev)
;;     (cl-dotimes (i (- (length prefix) 1))
;;       (setq prev (cdr (assoc (substring prefix 0 (- (+ i 1)))
;;                              company-candidates-cache)))
;;       (when prev
;; 	;; use the cache if element number >= 10
;; 	(cl-return (< (length (all-completions prefix prev)) 10)))
;;       )))
