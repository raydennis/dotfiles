;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Ray Dennis"
      user-mail-address "raydennis@outlook.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq
 doom-font (font-spec :family "FiraCode Nerd Font" :size 24 :weight 'regular)
 doom-variable-pitch-font (font-spec :family "FiraCode Nerd Font" :size 20)
 projectile-project-search-path '("~/Repositories/Azure")
 mac-command-modifier 'meta)

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(after! org-fancy-priorities
  (add-hook 'org-agenda-mode-hook 'org-fancy-priorities-mode)
  :config
  (setq org-fancy-priorities-list '("High" "Med" "Low" "☕")))

(after! org
  (map! :map org-mode-map
        :n "M-j" #'org-metadown
        :n "M-k" #'org-metaup
        )

  ;; If you would like a TODO entry to automatically change to DONE when all children
  ;; are done, you can use the following setup:
  (defun org-summary-todo (n-done n-not-done)
    "Switch entry to DONE when all subentries are done, to TODO otherwise."
    (let (org-log-done org-log-states)   ; turn off logging
      (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

  (add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

  (savehist-mode 1)
  (setq
        savehist-file "~/.emacs.d/tmp/savehist"
        org-image-actual-width 600
        org-archive-location "~/Repositories/Azure/Sandia/wnotes/archive.org::* From %s"
        org-ellipsis "…"
        org-superstar-headline-bullets-list '("Ⅰ" "Ⅱ" "Ⅲ" "Ⅳ" "Ⅴ" "Ⅵ" "Ⅶ" "Ⅷ" "Ⅸ" "Ⅹ" "Ⅺ" "Ⅻ")
        org-startup-folded t
        org-todo-keywords
        '((sequence "TODO(t!)"
                    "BLOCKED(w@/!)"
                    "STARTED(s!)"
                    "|" "DONE(d!)"
                    "CANCELLED(c!)"
                    ))
        org-attach-id-dir "./.attach"
  )
)

(setq scroll-margin 20)

;; mappings
(map! :leader :prefix "y" :desc "toggle word wrap" "w" #'toggle-word-wrap)
(map! :leader :desc "evil show regisers" "r" #'evil-show-registers)
(map! :leader :desc "show undow tree" "u" #'undo-tree-visualize)
(map! :leader :desc "show treemacs" "-" #'treemacs)
(map! :leader :prefix "z" :desc "correct previous word" "p" #'flyspell-check-previous-highlighted-word)
(map! :leader :prefix "z" :desc "correct previous word" "z" #'flyspell-auto-correct-word)


;; For some reason Doom disables auto-save and backup files by default. Let’s reenable them.
(setq auto-save-default t
      make-backup-files t)

;; Disable exit confirmation.
(setq confirm-kill-emacs nil)
