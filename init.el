;; .emacs.d/init.el

;; ===================================
;; MELPA Package Support
;; https://melpa.org/#/dotenv-mode
;; ===================================
;; Enables basic packaging support
(require 'package)

;; Adds the Melpa archive to the list of available repositories
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; Initializes the package infrastructure
(package-initialize)

;; If there are no archived package contents, refresh them
(when (not package-archive-contents)
  (package-refresh-contents))

;; Installs packages
;;
;; myPackages contains a list of package names
(defvar myPackages
  '(better-defaults                 ;; Set up some better Emacs defaults
;;    material-theme                  ;; Theme
    elpy                            ;; Emacs Lisp Python Environment
    flycheck                        ;; On the fly syntax checking
    py-autopep8                     ;; Run autopep8 on save
    blacken                         ;; Black formatting on save
    yaml-mode
    dotenv-mode
;;    markdown-mode
    )
  )

;; Scans the list in myPackages
;; If the package listed is not already installed, install it
(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      myPackages)

;; ===================================
;; Basic Customization
;; ===================================

(setq inhibit-startup-message t)    ;; Hide the startup message
;;(load-theme 'material t)            ;; Load material theme
(global-linum-mode t)               ;; Enable line numbers globally
(setq linum-format "%4d \u2502 ")   ;; set format for line numbe

;; User-Defined init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (material-theme better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )




;; ====================================
;; Development Setup
;; ====================================
;; Enable elpy
(elpy-enable)

;; Enable Flycheck

(when (require 'flycheck nil t)

  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))

  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; Enable autopep8

(require 'py-autopep8)

(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

  (require 'yaml-mode)
   (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))


(add-to-list 'auto-mode-alist '("\\.env\\..*\\'" . dotenv-mode)) ;; for optionally supporting additional file extensions such as `.env.test' with this major mode


;; User-Defined init.el ends here
