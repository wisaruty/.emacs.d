;; Try out projectile
(projectile-mode 1)
;;hook global
(add-hook 'after-init-hook 'global-company-mode)
;; Recommended keymap prefix on macOS
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
;; Recommended keymap prefix on Windows/Linux
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;;settings
(setq projectile-require-project-root nil)
(setq projectile-completion-system 'ivy)
(setq projectile-indexing-method 'native)

;; Trigger completion immediately.
(setq company-idle-delay 0)

;; Number the candidates (use M-1, M-2 etc to select completions).
(setq company-show-numbers t)

;;company-tabnine

;; Trigger completion immediately.
(setq company-idle-delay 0)

;; Number the candidates (use M-1, M-2 etc to select completions).
(setq company-show-numbers t)

(provide 'setup-ffip)
