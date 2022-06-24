
;;(add-to-list 'load-path "better-defaults-master/better-defaults")
;;(require 'better-defaults)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("fc48cc3bb3c90f7761adf65858921ba3aedba1b223755b5924398c666e78af8b" "a624baa81c72ce6c99164190896cca78e36a609e3748054501d6116b973b2d9b" "9527feeeec43970b1d725bdc04e97eb2b03b15be982ac50089ad223d3c6f2920" "c03d60937e814932cd707a487676875457e0b564a615c1edfd453f23b06fe879" "f3ec2da81c2b1f66f911fe47843a09055754b40fafaddcce79bbd4d781161329" "30c6aef3025cd6f05ccb611ec8838a448a14a6784987ed98b24f78916d63b388" "84ff07913c6109d12bfda40644daeaaa8f4665afb5f04e13e422bd98b02ee88b" "cf33119622dd833e4d8f904f34c5e3ff95d1d3d45bada72dd44648b3470bdebe" "f5776f3da6117901f29405fe52edb2bcba6a687629b4cbd5923d1a642484f2f9" "d56e289b10204629ac5c35b9621a650a534ef3baf183a1c601b4936482321df1" "50ceca952b37826e860867d939f879921fac3f2032d8767d646dd4139564c68a" "ff73e1b0216feca9e041dcb3196938442cc6aa8319f97eedbc2a3e38c8ca9825" "a18dd0a954ac63a80e62c8cb1b550ffcf5d8461189c7c672555faadf2facfcf3" "cb36f8e44d41595010baa23737984c4ecb2d8cc2e363ec15fbfa0408c2f8ea9f" "ea0c5df0f067d2e3c0f048c1f8795af7b873f5014837feb0a7c8317f34417b04" "9f42bccce1e13fa5017eb8718574db099e85358b9f424db78e7318f86d1be08f" default))
 '(flycheck-check-syntax-automatically '(save mode-enabled))
 '(flycheck-error-list-minimum-level nil)
 '(flycheck-idle-buffer-switch-delay 3.5)
 '(flycheck-idle-change-delay 3.5)
 '(ido-use-filename-at-point nil)
 '(package-selected-packages
   '(org-roam use-package ripgrep deadgrep multiple-cursors org-translateb meghanada ace-jump-mode expand-region flycheck magit company-tabnine golden-ratio yasnippet smartparens which-key key-chord eslint-fix js2-mode web-mode counsel-projectile fd-dired company projectile find-file-in-project ag ivy zenburn-theme better-defaults ##))
 '(projectile-globally-ignored-directories
   '("^\\.idea$" "^\\.vscode$" "^\\.ensime_cache$" "^\\.eunit$" "^\\.git$" "^\\.hg$" "^\\.fslckout$" "^_FOSSIL_$" "^\\.bzr$" "^_darcs$" "^\\.pijul$" "^\\.tox$" "^\\.svn$" "^\\.stack-work$" "^\\.ccls-cache$" "^\\.cache$" "^\\.clangd$" "target" "dist" "node_modules" "build" "lib"))
 '(projectile-globally-ignored-file-suffixes nil)
 '(projectile-sort-order 'default)
 '(safe-local-variable-values
   '((eval font-lock-add-keywords nil
	   '(("defexamples\\|def-example-group\\| => "
	      (0 'font-lock-keyword-face))
	     ("(defexamples[[:blank:]]+\\(.*\\)"
	      (1 'font-lock-function-name-face))))
     (eval font-lock-add-keywords nil
	   '(("defexamples\\|def-example-group\\| => "
	      (0 'font-lock-keyword-face))))
     (eval when
	   (and
	    (buffer-file-name)
	    (file-regular-p
	     (buffer-file-name))
	    (string-match-p "^[^.]"
			    (buffer-file-name)))
	   (emacs-lisp-mode))
     (eval font-lock-add-keywords nil
	   '(("defexamples\\| => "
	      (0 'font-lock-keyword-face))))
     (encoding . utf-8)))
 '(size-indication-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-error-face ((t nil)) t)
 '(js2-warning-face ((t nil)) t))
