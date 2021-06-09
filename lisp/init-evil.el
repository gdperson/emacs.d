(require-package 'evil)
(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)
  (define-key evil-insert-state-map (kbd "C-n") 'evil-next-line-first-non-blank)
  (define-key evil-insert-state-map (kbd "C-p") 'evil-previous-line-first-non-blank)

  (define-key evil-normal-state-map (kbd "C-e") 'evil-end-of-line))

(require-package 'evil-collection)
(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))
;; (global-set-key (kbd "C-e") 'end-of-line)

(provide 'init-evil)
