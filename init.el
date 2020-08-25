(require 'package)

(setq gc-cons-threshold 100000000)

(setq read-process-output-max (* 1024 1024)) ;; 1mb
;; (add-to-list 'package-archives
;;              '("melpa" . "https://melpa.org/packages/"))

(setq package-archives
      '(("melpa"        . "https://melpa.org/packages/")
	("melpa-stable" . "https://stable.melpa.org/packages/"))
      package-archive-priorities
      '(("melpa"        . 10)
	("melpa-stable" . 5)))

(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)

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
