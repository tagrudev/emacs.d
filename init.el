;;; init.el --- tagrudev's Emacs configuration
;;
;; Author: Todor Grudev <tagrudev@gmail.com>
;; URL: https://github.com/tagrudev/emacs.d

;;; Packages

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(setq package-user-dir (expand-file-name "elpa" user-emacs-directory))
(package-initialize)

(setq user-full-name "Todor Grudev"
      user-mail-address "tagrudev@gmail.com")

;; Always load newest byte code
(setq load-prefer-newer t)

;; reduce the frequency of garbage collection by making it happen on
;; each 50MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 50000000)

;; disable startup screen
(setq inhibit-startup-screen t)

;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)
(scroll-bar-mode -1)

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)
(global-linum-mode t)

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; don't use tabs to indent
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; new line at the end
(setq require-final-newline t)

;; revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)

;; utf8 all the way
(prefer-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-selection-coding-system 'utf-8)
(set-locale-environment "en_GB.UTF-8")

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; atom theme
(load-theme 'atom-one-dark t)

;; remove the menu
(menu-bar-mode -1)
(tool-bar-mode -1)

;; go for maximum
(toggle-frame-maximized)

;; remove sounds
(setq ring-bell-function 'ignore)

;; change meta from alt to cmd
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;; ruby-mode tweaks
(setq ruby-insert-encoding-magic-comment nil)

;;; Custom keybindings
(load "~/.emacs.d/keys.el")

;;
;; Hooks
;;

;; trim your whitespaces
(add-hook 'before-save-hook 'whitespace-cleanup)
