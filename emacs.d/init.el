;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; name:    init.el
;; author:  QubeX2
;; date:    2015-02-03
;; 
;;; DISPLAY ISSUES
;;===============================================================================
(if (display-graphic-p) ; if windowed mode
    (progn
      (tool-bar-mode -1)
      (x-focus-frame nil)
      (setq default-frame-alist '((width . 150)(height . 52)))))

(add-to-list 'custom-theme-load-path "~/.emacs.d/bundle/molokai-theme/")
(load-theme 'molokai t)

;;; KEYBOARD SETTINGS
;;===============================================================================
(when (eq system-type 'darwin)
  (setq mac-option-key-is-meta nil)
  (setq mac-option-modifier nil)
  (setq mac-command-modifier 'meta)
  (setq mac-command-key-is-meta t))

;;; SETTINGS
;;===============================================================================
;; initial settings
(setq inhibit-startup-message t
      default-directory (concat (getenv "HOME") "/")
      initial-scratch-message nil
      initial-major-mode 'org-mode
      make-backup-files nil
      auto-save-default nil
      echo-keystrokes 0.1
      use-dialog-box nil
      visible-bell t
      tab-stop-list (number-sequence 4 200 4))


;; automatic parenthesis
(electric-pair-mode t)
(setq electric-pair-pairs '((?\" . ?\")
 			    (?\' . ?\')
			    (?\{ . ?\})
			    ))

;; line number
(global-linum-mode t)
(setq linum-format "%4d"
      line-number-mode t
      column-number-mode t)

;; parentheses
(show-paren-mode t)

;;; SELECTION
;;===============================================================================
(delete-selection-mode t)
(transient-mark-mode t)
(setq x-select-enable-clipboard t)

;;; MODES
;;===============================================================================

;; org mode
(setq org-startup-indented t) ;show everything at start

;; ido mode
(ido-mode t)
(icomplete-mode t)
(ido-everywhere t)
(setq ido-create-new-buffer 'always)
(setq ido-enable-flex-matching t)

;; common lisp
(require 'cl)

;; remove toolbar and menubar
;;---------------------------------------
(menu-bar-mode -1)

;; web-mode
(add-to-list 'load-path "~/.emacs.d/bundle/web-mode")
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.inc?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;;; KEYS
;;===============================================================================
;; elisp
(define-key emacs-lisp-mode-map (kbd "C-c e") 'eval-buffer)

;; global
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "<f6>") 'my-search-thing-at-point)
(global-set-key (kbd "<f5>") 'my-string-replace)
(global-set-key (kbd "<backtab>") 'indent-for-tab-command) ; S+<tab>
(global-set-key (kbd "C-c <left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-c <right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-c <down>") 'shrink-window)
(global-set-key (kbd "C-c <up>") 'enlarge-window)
(global-set-key (kbd "<f8>") 'execute-extended-command) ; M-x

;;; ALIASES
;;===============================================================================
(defalias 'list-buffers 'ibuffer)
(defalias 'esh 'eshell)
(defalias 'sh 'shell)
(defalias 'cc 'calc)
(defalias 'ca 'calendar)
(defalias 'rs 'replace-string)

;;; CUSTOM SET VARIABLES
;;===============================================================================
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fci-rule-color "#383838")
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(linum ((t (:inherit (shadow default) :background "#333333" :foreground "999999"))))
 '(show-paren-match ((t (:background "#8b0000" :foreground "#fa8072")))))

;;; FUNCTIONS
;;===============================================================================
(defun my-search-thing-at-point ()
  "search thing at point"
  (interactive)
  (let (ref p)
    (setq ref (thing-at-point 'symbol))
    (setq p (search-forward ref nil t))
    (if p
	(goto-char p))))

(defun my-string-replace (str)
  "Replace string at point"
  (interactive "sRename to: ")
  (save-excursion
    (let (ref)
      (setq ref (thing-at-point 'symbol))
      (replace-string ref str nil (point-min) (point-max)))))

(defun my-manual-entry ()
  "Manual entry thing at point"
  (interactive)
  (save-excursion
    (let (ref)
      (setq ref (thing-at-point 'symbol))
      (manual-entry ref)
      (select-window (next-window)))))
