;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
(setq
 user-full-name "Ray Dennis"
 user-mail-address "raydennis@outlook.com"
 doom-font (font-spec :family "FiraCode Nerd Font" :size 24 :weight 'regular)
 doom-variable-pitch-font (font-spec :family "FiraCode Nerd Font" :size 20)
 projectile-project-search-path '("~/Repositories/Azure")
 mac-command-modifier 'meta
 scroll-margin 20
 confirm-kill-emacs nil
 auto-save-default t
 make-backup-files t
 doom-theme 'doom-one
 display-line-numbers-type nil
 org-directory "~/org/"
 magit-ediff-dwim-show-on-hunks t
)

; [Ace-Window] This changes the ace-window display to show a white letter with a red background. The box attribute adds some padding.
(custom-set-faces!
  '(aw-leading-char-face
    :foreground "white" :background "red"
    :weight bold :height 2.5 :box (:line-width 10 :color "red")))

(map!
 :leader :prefix "y" :desc "toggle word wrap" "w" #'toggle-word-wrap
 :leader :desc "evil show regisers" "r" #'evil-show-registers
 :leader :desc "show undow tree" "u" #'undo-tree-visualize
 :leader :desc "show treemacs" "-" #'treemacs
 :leader :prefix "z" :desc "correct previous word" "p" #'flyspell-check-previous-highlighted-word
 :leader :prefix "z" :desc "correct previous word" "z" #'flyspell-auto-correct-word
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
