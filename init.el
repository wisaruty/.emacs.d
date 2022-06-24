;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
;; commands stop
;; net stop netlogon
;; no wrap text default M-x toggle-truncate-lines
(set-default 'truncate-lines t)
;; window move
(windmove-default-keybindings)

;; fix window create buffer to slow 
(remove-hook 'find-file-hooks 'vc-find-file-hook)
(setq recentf-auto-cleanup 'never)
(setq w32-get-true-file-attributes nil)


(set-locale-environment "English")
(set-language-environment 'English)
;; (prefer-coding-system 'utf-8)
;; (set-file-name-coding-system 'gbk)
;; (set-buffer-file-coding-system 'utf-8)
;; (set-keyboard-coding-system 'utf-8)
;; (set-terminal-coding-system 'utf-8)
;; (set-selection-coding-system 'utf-8)
;; (set-clipboard-coding-system 'utf-8)
;; (set-w32-system-coding-system 'utf-8)

(setq default-directory "D:/workspace/" )
(load-theme 'zenburn t)


(eval-after-load "enriched"
  '(defun enriched-decode-display-prop (start end &optional param)
     (list start end)))

;;Font
(set-frame-font "Fira Code 10" nil t)

;; No splash screen please ... jeez
(setq inhibit-startup-message t)


;; Set path to dependencies
(setq settings-dir
      (expand-file-name "settings" user-emacs-directory))

;; Set up load path
(add-to-list 'load-path settings-dir)


;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Write all autosave files in the tmp dir
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Don't write lock-files, I'm the only one here
(setq create-lockfiles nil)

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable iff desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)


;; Setup extensions
(require 'setup-ffip)
;;web
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))


(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(require 'eslint-fix)
;;(add-hook 'web-mode #'eslint-fix-auto-mode)
(add-hook 'js2-mode-hook #'eslint-fix-auto-mode)
(add-hook 'web-mode-hook #'eslint-fix-auto-mode)

(require 'smartparens-config)
;; Always start smartparens mode in js-mode.
(add-hook 'js2-mode-hook #'smartparens-mode)
(add-hook 'web-mode-hook #'smartparens-mode)


(require 'key-chord)
(key-chord-mode 1)
(key-chord-define-global "fd"   'forward-symbol)
(key-chord-define-global "fg"   'sp-backward-symbol)
(key-chord-define-global "jk"   'ace-jump-mode)
(key-chord-define-global "rl"   'eslint-fix)








(require 'which-key)
(which-key-mode 1)
(setq which-key-use-C-h-commands nil)


(require 'golden-ratio)
(golden-ratio-mode 1)

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)


(require 'meghanada)
(add-hook 'java-mode-hook
          (lambda ()
            ;; meghanada-mode on
            (meghanada-mode t)
            (flycheck-mode +1)
            (setq c-basic-offset 2)))
	    
(cond
   ((eq system-type 'windows-nt)
    (setq meghanada-java-path (expand-file-name "bin/java.exe" (getenv "JAVA_HOME")))
    (setq meghanada-maven-path "mvn.cmd"))
   (t
    (setq meghanada-java-path "java")
    (setq meghanada-maven-path "mvn")))


(require 'yasnippet)
;; Use only own snippets, do not use bundled ones
(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
(yas-global-mode 1)


(require 'multiple-cursors)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)


(require 'deadgrep)
(global-set-key (kbd "<f5>") #'deadgrep)


(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory (file-truename "D:\\zzDocument\\org-files"))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ;; Dailies
         ("C-c n j" . org-roam-dailies-capture-today))
  :config
  ;; If you're using a vertical completion framework, you might want a more informative completion interface
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-db-autosync-mode)
  ;; If using org-roam-protocol
  (require 'org-roam-protocol))
