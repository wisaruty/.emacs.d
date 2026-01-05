';;slowdowns when working with network drives or remote files.
(setq w32-get-true-file-attributes t)
;;This can improve file handling performance
(setq file-name-handler-alist nil)
;; non check signature
(setq package-check-signature nil)



(setq package-enable-at-startup nil)

;; Disable the splash screen and startup message.
(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message t)

;; Set the GC threshold to a higher value for better performance.
(setq gc-cons-threshold (* 8 1000 1024 1024)) ; 100 MB now set 8G

;; start straight manage package
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(dolist (pkg '(gptel emmet-mode swiper ag ripgrep ace-jump-mode magit flycheck projectile ivy web-mode multiple-cursors org-roam org-roam-ui deadgrep js2-mode eslint-fix key-chord which-key golden-ratio expand-region yasnippet zenburn-theme rainbow-delimiters ))
   (straight-use-package pkg))
;;end straight manage package

;; Load minimal features early to improve startup time.
(setq package-enable-at-startup nil)
(advice-add #'package--ensure-init-file :override #'ignore)

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
;; package not check signature
;;(setq package-check-signature nil) ;; step1
;;gnu-elpa-keyring-update ;; step2
;; fix window create buffer to slow 
(remove-hook 'find-file-hooks 'vc-find-file-hook)
;; (setq recentf-auto-cleanup 'never)
(setq w32-get-true-file-attributes nil)

;;set environment
;;(set-locale-environment "English")
;;(set-language-environment 'English)

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
(set-frame-font "Fira Code 11" nil t)
;;(set-frame-font "Consolas 11" nil t)

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







;; package
;; (require 'package)
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; ;; Comment/uncomment this line to enable MELPA Stable iff desired.  See `package-archive-priorities`
;; ;; and `package-pinned-packages`. Most users will not need or want to do this.
;; ;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;; (package-initialize)
;; ;; Start lazy loading
;; (unless (package-installed-p 'use-package)
;;   (package-refresh-contents)
;;   (package-install 'use-package))

;; (eval-when-compile
;;   (require 'use-package))
;; end lazy loading


;; Setup extensions
(require 'setup-ffip)
;;web
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))

(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . js2-mode))

(require 'eslint-fix)
(add-hook 'web-mode #'eslint-fix-auto-mode)
(add-hook 'js2-mode-hook #'eslint-fix-auto-mode)
(add-hook 'web-mode-hook #'eslint-fix-auto-mode)


;; (require 'smartparens-config)
;; ;; Always start smartparens mode in js-mode.
;; (add-hook 'js2-mode-hook #'smartparens-mode)
;; (add-hook 'web-mode-hook #'smartparens-mode)
;; (add-hook 'java-mode-hook #'smartparens-mode)


(require 'key-chord)
(key-chord-mode 1)
(key-chord-define-global "fd"   'forward-symbol)
(key-chord-define-global "fg"   'sp-backward-symbol)
(key-chord-define-global "jk"   'ace-jump-mode)
(key-chord-define-global "rl"   'eslint-fix)

(require 'which-key)
(which-key-mode 1)
(which-key-setup-minibuffer)
;; (which-key-setup-side-window-right-bottom)
;; (setq which-key-use-C-h-commands nil)


(require 'golden-ratio)
(golden-ratio-mode 1)

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)


;; (require 'meghanada)
;; (add-hook 'java-mode-hook
;;           (lambda ()
;;             ;; meghanada-mode on
;;             (meghanada-mode t)
;;             (flycheck-mode +1)
;;             (setq c-basic-offset 2)))
	    
;; (cond
;;    ((eq system-type 'windows-nt)
;;     (setq meghanada-java-path (expand-file-name "bin/java.exe" (getenv "JAVA_HOME")))
;;     (setq meghanada-maven-path "mvn.cmd"))
;;    (t
;;     (setq meghanada-java-path "java")
;;     (setq meghanada-maven-path "mvn")))


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

;; enable paredit
(add-hook 'lisp-mode-hook 'enable-paredit-mode)
(add-hook 'clojure-mode-hook 'enable-paredit-mode)

;; rainbow brakets
(add-hook 'js2-mode-hook #'rainbow-delimiters-mode)
(add-hook 'web-mode-hook #'rainbow-delimiters-mode)
(add-hook 'java-mode-hook #'rainbow-delimiters-mode)


;; ติดตั้ง org-roam ด้วย straight.el
(straight-use-package 'org-roam)

;; โหลด org-roam
(require 'org-roam)

;; ตั้งค่าเบื้องต้น
(setq org-roam-v2-ack t
      org-roam-directory (file-truename "D:\\OneDrive - Krungthai Bank Public Company Limited\\Documents\\Roam-Notes")
      org-roam-completion-everywhere t
      org-roam-capture-templates
      '(("d" "default" plain
         "%?"
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
         :unnarrowed t)
        ("l" "programming language" plain
         "* Characteristics\n\n- Family: %?\n- Inspired by: \n\n* Reference:\n\n"
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
         :unnarrowed t)
        ("b" "book notes" plain
         "\n* Source\n\nAuthor: %^{Author}\nTitle: ${title}\nYear: %^{Year}\n\n* Summary\n\n%?"
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
         :unnarrowed t)
        ("p" "project" plain
         "* Goals\n\n%?\n\n* Tasks\n\n** TODO Add initial tasks\n\n* Dates\n\n"
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: Project")
         :unnarrowed t)))

;; ตั้งค่า keybindings
(global-set-key (kbd "C-c n l") #'org-roam-buffer-toggle)
(global-set-key (kbd "C-c n f") #'org-roam-node-find)
(global-set-key (kbd "C-c n i") #'org-roam-node-insert)
(with-eval-after-load 'org
  (define-key org-mode-map (kbd "C-M-i") #'completion-at-point))

;; เริ่มต้น org-roam
(org-roam-db-autosync-mode)
(org-roam-setup)


(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)


;; config swiper
;; (ivy-mode)
;; (setq ivy-use-virtual-buffers t)
;; (setq enable-recursive-minibuffers t)
(global-set-key (kbd "C-c s") 'swiper-all)

;; ;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
;; (global-set-key "\C-s" 'swiper)
;; (global-set-key (kbd "C-c C-r") 'ivy-resume)
;; (global-set-key (kbd "<f6>") 'ivy-resume)
;; (global-set-key (kbd "M-x") 'counsel-M-x)
;; (global-set-key (kbd "C-x C-f") 'counsel-find-file)
;; (global-set-key (kbd "<f1> f") 'counsel-describe-function)
;; (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
;; (global-set-key (kbd "<f1> o") 'counsel-describe-symbol)
;; (global-set-key (kbd "<f1> l") 'counsel-find-library)
;; (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
;; (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
;; (global-set-key (kbd "C-c g") 'counsel-git)
;; (global-set-key (kbd "C-c j") 'counsel-git-grep)
;; (global-set-key (kbd "C-c k") 'counsel-ag)
;; (global-set-key (kbd "C-x l") 'counsel-locate)
;; (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
;; (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

;; (global-set-key (kbd "C-x f") 'counsel-recentf)


;; lsp java
;;(require 'lsp-java)
;;(add-hook 'java-mode-hook #'lsp)


;; current VSCode defaults
;;(setq lsp-java-vmargs '("-XX:+UseParallelGC" "-XX:GCTimeRatio=4" "-XX:AdaptiveSizePolicyWeight=90" "-Dsun.zip.disableMemoryMapping=true" "-Xmx2G" "-Xms100m"))

;; (setq lsp-java-vmargs
;;       (list
;;        "-XX:+UseParallelGC"
;;        "-XX:GCTimeRatio=4"
;;        "-XX:AdaptiveSizePolicyWeight=90"
;;        "-Dsun.zip.disableMemoryMapping=true"
;;        "-Xmx4G"
;;        "-Xms100m"       
;;        "-javaagent:/zz_document/lib/lombok.jar"))

;; ติดตั้ง corfu
(straight-use-package 'corfu)

(require 'corfu)

(setq corfu-auto t
      corfu-cycle t
      corfu-preview-current nil
      corfu-min-width 20
      corfu-max-width 80
      )

(global-corfu-mode 1)
(corfu-indexed-mode 1)

;; loop for corfu mode map
(dotimes (i 10)
  (define-key corfu-mode-map
                    (kbd (format "M-%s" i))
                    (kbd (format "C-%s <tab>" i))))

;; ติดตั้ง cape
(straight-use-package 'cape)
(require 'cape)
(setq completion-at-point-functions
      (list #'cape-dabbrev
            #'cape-keyword
	    #'cape-file
	    ))


;; ติดตั้ง vertico
(straight-use-package 'vertico)
(require 'vertico)
(vertico-mode 1)
(setq vertico-count 10)




;; ติดตั้ง orderless
(straight-use-package 'orderless)
(require 'orderless)
(setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides
        '((file (styles partial-completion)))
        orderless-matching-styles
        '(orderless-literal
          orderless-regexp
          orderless-initialism)
	orderless-component-separator "[& ]")

;; (add-hook 'eshell-mode-hook
;;           (lambda ()
;;             (corfu-mode -1)))


;; ติดตั้ง marginalia
(straight-use-package 'marginalia)
(require 'marginalia)
(marginalia-mode 1)

;;Emmet-mode
(add-hook 'web-mode-hook #'emmet-mode)


;;gemini cil

(setq
 gptel-model 'gemini-2.5-flash
 gptel-backend (gptel-make-gemini "Gemini"
                 :key "AIzaSyAj84BoPQSS0twbgPY5GzrPpDNrpwph2K8"
                 :stream t))



