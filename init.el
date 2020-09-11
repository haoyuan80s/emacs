(require 'package)

(setq gc-cons-threshold 100000000)

(setq read-process-output-max (* 1024 1024)) ;; 1mb
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

;; (setq package-archives
;;       '(("melpa"        . "https://melpa.org/packages/")
;; 	("melpa-stable" . "https://stable.melpa.org/packages/"))
;;       package-archive-priorities
;;       '(("melpa"        . 10)
;; 	("melpa-stable" . 5)))

;; (add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)

;; Initialise the packages, avoiding a re-initialisation.
(unless (bound-and-true-p package--initialized)
  (setq package-enable-at-startup nil)
  (package-initialize))

;; Make sure `use-package' is available.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Configure `use-package' prior to loading it.
(eval-and-compile
  (setq use-package-always-ensure t)
  (setq use-package-always-defer t)
  (setq use-package-always-demand nil)
  (setq use-package-expand-minimally nil)
  (setq use-package-enable-imenu-support t))

(eval-when-compile
  (require 'use-package))

(require 'org)
;; (setq vc-follow-symlinks t)
(add-to-list 'load-path "~/.emacs.d/lisp/")
(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))
;;(load-file "~/.emacs.d/_config.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(youdao-dictionary yasnippet-snippets yaml-mode whole-line-or-region which-key web-mode vterm visual-regexp-steroids use-package try treemacs-projectile treemacs-persp treemacs-magit treemacs-icons-dired toml-mode tide smartparens slime-company skewer-mode scratch rustic rg rainbow-mode rainbow-delimiters python-black ox-twbs outorg org-tree-slide org-bullets olivetti nlinum multiple-cursors modus-vivendi-theme modus-operandi-theme lua-mode lsp-ui lsp-ivy ivy-hydra impatient-mode ibuffer-vc go-dlv gnu-elpa-keyring-update fullframe format-all flycheck-joker expand-region exec-path-from-shell evil eglot doom-themes doom-modeline dmenu dashboard dap-mode csv-mode crux counsel-projectile company-web clojure-snippets cider ccls beacon auto-package-update amx all-the-icons-ivy-rich)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
