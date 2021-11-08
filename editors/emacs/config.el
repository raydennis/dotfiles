;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(use-package doom-themes
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-wilmersdorf t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)

  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
  (doom-themes-treemacs-config)

  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config)
)

(setq
 user-full-name "Ray Dennis"
 user-mail-address "raydennis@outlook.com"
 doom-font (font-spec :family "FiraCode Nerd Font" :size 20 :weight 'regular)
 doom-variable-pitch-font (font-spec :family "FiraCode Nerd Font" :size 16)
 projectile-project-search-path '("~/Repositories/Azure")
 mac-command-modifier 'meta
 scroll-margin 20
 auto-save-default t
 make-backup-files t
 display-line-numbers-type nil
 org-directory "~/org/"
 magit-ediff-dwim-show-on-hunks t
)

(map!
 :leader :prefix "y" :desc "toggle word wrap" "w" #'toggle-word-wrap
 :leader :prefix "y" :desc "evil show registers" "r" #'evil-show-registers
 :leader :prefix "y" :desc "show undo tree" "u" #'undo-tree-visualize
 :leader :prefix "y" :desc "show treemacs" "-" #'treemacs
 :leader :prefix "z" :desc "correct previous word" "p" #'flyspell-check-previous-highlighted-word
 :leader :prefix "f" :desc "ranger" "." #'ranger
 )

(after! org-journal
  (setq
   org-journal-dir "~/Repositories/Azure/Sandia/wnotes/Journal"
   org-journal-date-prefix "#+TITLE: "
   org-journal-time-prefix "* "
   org-journal-date-format "%a, %Y-%m-%d"
   org-journal-file-format "%Y-%m-%d.org"
        )

)

(after! org-fancy-priorities
  (add-hook 'org-agenda-mode-hook 'org-fancy-priorities-mode)
  :config
  (setq org-fancy-priorities-list '("High" "Med" "Low" "☕")))

(after! org
  (map! :map org-mode-map
        :n "M-j" #'org-metadown
        :n "M-k" #'org-metaup
        )

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
                    "STARTED(s!)"
                    "WAITING(w@!)"
                    "BLOCKED(b@/!)"
                    "|" "DONE(d!)"
                    "CANCELLED(c!)"
                    ))
        org-todo-keyword-faces
        '(("TODO" . org-warning)
          ("STARTED" . "yellow")
          ("WAITING" . "green")
          ("BLOCKED" . "red" )
          ("CANCELED" . (:foreground "blue" :weight bold))
          )
        org-attach-id-dir "./.attach"
  )
)

(use-package switch-window
  :ensure t
  :bind
  ;; default C-x o is other-window
  ;; default C-x C-o is delete-blank-lines
  (("C-x o" . switch-window)
   ("C-x C-o" . switch-window))
  :config
  (setq switch-window-multiple-frames t)
  (setq switch-window-shortcut-style 'qwerty)
  ;; when Emacs is run as client, the first shortcut does not appear
  ;; "x" acts as a dummy; remove first entry if not running server
  (setq switch-window-qwerty-shortcuts '("x" "a" "s" "d" "f" "j" "k" "l" ";" "w" "e" "r" "u" "i" "o" "q" "t" "y" "p"))
  (setq switch-window-increase 3))
