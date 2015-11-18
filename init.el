(defun dotspacemacs/layers ()
  (setq-default

   dotspacemacs-configuration-layer-path '("~/.spacemacs.d/")
   dotspacemacs-delete-orphan-packages t
   dotspacemacs-distribution 'spacemacs

   dotspacemacs-configuration-layers
   `((auto-completion
      :variables
      auto-completion-return-key-behavior nil
      auto-completion-tab-key-behavior 'cycle
      auto-completion-private-snippets-directory "~/.spacemacs.d/snippets/"
      :disabled-for org erc)
     c-c++
     clojure
     csharp
     django
     emacs-lisp
     emoji
     erc
     ess
     extra-langs
     eyebrowse
     games
     git
     github
     haskell
     html
     (ibuffer :variables ibuffer-group-buffers-by nil)
     javascript
     latex
     markdown
     org
     python
     ranger
     ruby
     semantic
     (shell :variables shell-default-shell 'eshell)
     shell-scripts
     (syntax-checking :variables syntax-checking-enable-by-default nil)
     (theming :variables
              theming-headings-inherit-from-default 'all
              theming-headings-same-size 'all
              theming-headings-bold 'all)
     unimpaired
     version-control
     yaml
     (typography :variables typography-enable-typographic-editing t)

     ,@(unless (string= system-type "windows-nt")
         '(fasd
           gtags
           (spell-checking :variables spell-checking-enable-by-default nil)
           spotify))

     ;; Non-contrib layers
     encoding
     evil-little-word
     evil-shift-width
     no-dots

     ;; Personal config layers
     bb-c-styles
     bb-ibuffer)

   dotspacemacs-additional-packages
   `(helm-flycheck
     (helm-fuzzier :location (recipe :fetcher github
                                     :repo "EphramPerdition/helm-fuzzier"))
     help-fns+
     nameless
     nginx-mode

     ,@(unless (string= system-type "windows-nt")
         '(powerline
           (spaceline :location "~/repos/spaceline/"))))

   dotspacemacs-excluded-packages
   `(julia-mode
     ,@(when (string= system-type "windows-nt")
         '(evil-mc)))))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-editing-style 'vim
   dotspacemacs-startup-banner nil
   dotspacemacs-startup-lists '(recents bookmarks projects)
   dotspacemacs-startup-recent-list-size 5
   dotspacemacs-themes
   '(monokai material spacemacs-dark spacemacs-light solarized-dark leuven zenburn)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font
   `("Source Code Pro"
     :size ,(if (string= system-type "windows-nt") 16 13)
     :weight normal :width normal :powerline-scale 1.15)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-command-key ":"
   dotspacemacs-remap-Y-to-y$ t
   dotspacemacs-default-layout-name "Home"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 10
   dotspacemacs-use-ido nil
   dotspacemacs-helm-resize t
   dotspacemacs-helm-no-header t
   dotspacemacs-helm-position 'bottom
   dotspacemacs-enable-paste-micro-state t
   dotspacemacs-which-key-delay 1.0
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-mode-line-unicode-symbols nil
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers nil
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup 'changed))

(defun dotspacemacs/user-init ()
  (setq-default

   ;; Miscellaneous
   vc-follow-symlinks t
   ring-bell-function 'ignore
   require-final-newline t
   indent-tabs-mode nil
   system-time-locale "C"
   paradox-github-token t

   ;; Backups
   backup-directory-alist `((".*" . ,temporary-file-directory))
   auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
   backup-by-copying t
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   make-backup-files nil

   ;; Evil
   evil-shift-round nil

   ;; Whitespace mode
   whitespace-style '(face tabs tab-mark newline-mark)
   whitespace-display-mappings
   '((newline-mark 10 [172 10])
     (tab-mark 9 [9655 9]))

   ;; Smartparens
   sp-highlight-pair-overlay nil
   sp-highlight-wrap-overlay nil
   sp-highlight-wrap-tag-overlay nil

   ;; Magit
   magit-push-always-verify nil
   magit-popup-show-common-commands nil

   ;; Flycheck
   flycheck-check-syntax-automatically '(save mode-enabled)

   ;; Avy
   avy-all-windows 'all-frames

   ;; Ranger
   ranger-override-dired t

   ;; Spaceline
   spaceline-buffer-encoding-abbrev-p nil
   spaceline-version-control-p nil

   ;; Matlab
   matlab-auto-fill nil
   matlab-fill-code nil
   matlab-functions-have-end t
   matlab-indent-function-body t

   ;; LaTeX
   font-latex-fontify-script nil
   TeX-newline-function 'reindent-then-newline-and-indent
   shell-default-term-shell "/bin/zsh"

   ;; Web
   web-mode-markup-indent-offset 2
   web-mode-css-indent-offset 2

   ;; Emacs Lisp
   nameless-global-aliases
   '(("sm" . "spacemacs")
     ("dsm" . "dotspacemacs")
     ("cfl" . "configuration-layer")
     ("sl" . "spaceline")
     ("eip" . "evil-indent-plus"))
   nameless-discover-current-name nil
   nameless-prefix ""
   nameless-separator nil

   ;; Org
   org-tags-column -80
   org-clock-into-drawer "LOGBOOK"
   org-log-into-drawer "LOGBOOK"
   org-startup-align-all-tables t
   org-footnote-auto-adjust t
   org-footnote-auto-label 'confirm
   org-M-RET-may-split-line
   '((headline . nil) (item . nil) (table . nil))
   org-agenda-restore-windows-after-quit t
   org-agenda-window-setup 'other-window
   org-directory "~/org"
   org-default-notes-file "~/org/capture.org"
   org-agenda-files '("~/org/" "~/org/projects/" "~/org/misc/")
   org-catch-invisible-edits 'show-and-error
   org-list-demote-modify-bullet '(("-" . "*")
                                   ("*" . "+")
                                   ("+" . "-"))
   org-list-allow-alphabetical t
   org-capture-templates
   '(("t" "Tasks")
     ("tg" "General" entry (file+headline "" "Tasks")
      "* TODO %?\n%i\n%U"
      :empty-lines 1)
     ("tl" "Location" entry (file+headline "" "Tasks")
      "* TODO %?\n%i\n%U\n%a"
      :empty-lines 1)
     ("n" "Notes")
     ("ng" "General" entry (file+headline "" "Notes")
      "* %?\n%i\n%U"
      :empty-lines 1)
     ("nl" "Location" entry (file+headline "" "Notes")
      "* %?\n%i\n%U\n%a"
      :empty-lines 1))

   ;; IRC
   erc-autojoin-channels-alist
   '(("1\\.0\\.0" "#syl20bnr/spacemacs" "#syl20bnr/spacemacs-devel") ; Gitter
     ("irc.gitter.im" "#syl20bnr/spacemacs" "#syl20bnr/spacemacs-devel")
     ("freenode\\.net" "#emacs" "#emacs-beginners" "#spacemacs"))
   erc-timestamp-format-left "\n%A %B %e, %Y\n\n"
   erc-timestamp-format-right "%H:%M"
   erc-timestamp-right-column 80
   erc-prompt-for-nickserv-password nil
   erc-image-inline-rescale 300
   erc-hide-list '("JOIN" "PART" "QUIT" "NICK")
   erc-foolish-content
   '("\\[Github\\].* starred"
     "\\[Github\\].* forked"
     "\\[Github\\].* synchronize a Pull Request"
     "\\[Github\\].* labeled an issue in"
     "\\[Github\\].* unlabeled an issue in")

   ;; Theme modifications
   theming-modifications
   '((monokai
      ;; Font locking
      (font-lock-comment-face :slant italic)
      (font-lock-string-face :slant italic)
      (font-lock-doc-face :slant italic)
      (font-lock-keyword-face :weight bold)
      (font-lock-builtin-face :foreground "#ff9eb8")
      (font-lock-warning-face :underline nil)
      (web-mode-html-attr-value-face
       :inherit font-lock-string-face :foreground nil)
      (web-mode-html-attr-name-face
       :inherit font-lock-variable-name-face :foreground nil)
      (web-mode-html-tag-face
       :inherit font-lock-builtin-face :foreground nil :weight bold)
      (web-mode-html-tag-bracket-face
       :inherit web-mode-html-tag-face :foreground nil)
      (web-mode-comment-face
       :inherit font-lock-comment-face :foreground nil)

      ;; Modeline
      (mode-line :box (:color "#999999" :line-width 1 :style released-button))
      (powerline-active1 :box (:color "#999999" :line-width 1 :style released-button)
                         :background "#5a5a5a")
      (powerline-active2 :box (:color "#999999" :line-width 1 :style released-button))
      (mode-line-inactive :box (:color "#666666" :line-width 1 :style released-button))
      (powerline-inactive1 :box (:color "#666666" :line-width 1 :style released-button))
      (powerline-inactive2 :box (:color "#666666" :line-width 1 :style released-button))
      (helm-prefarg :foreground "PaleGreen")

      ;; Flycheck
      (flycheck-fringe-error :background nil)
      (flycheck-fringe-warning :background nil)
      (flycheck-fringe-info :background nil)

      ;; Other
      (company-tooltip-annotation
       :foreground "#ff9eb8" :background "#49483e")
      (erc-timestamp-face
       :inherit font-lock-comment-face :foreground nil)
      (evil-search-highlight-persist-highlight-face
       :background "#fc5fef" :foreground "#000000")
      (region :background "#998f84")
      (term :foreground nil :background nil)))))

(defun dotspacemacs/user-config ()

  ;; Utility functions
  (defun bb/define-key (keymap &rest bindings)
    (declare (indent 1))
    (while bindings
      (define-key keymap (pop bindings) (pop bindings))))

  (defmacro bb/remove-from-list (list-var element)
    `(setq ,list-var (remove ,element ,list-var)))

  ;; Settings
  (setq-default
   tab-width 8
   evil-move-beyond-eol nil
   helm-echo-input-in-header-line nil
   powerline-default-separator 'alternate)

  (dolist (e '(("xml" . web-mode)
               ("xinp" . web-mode)
               ("C" . c++-mode)
               ("h" . c++-mode)))
    (push (cons (concat "\\." (car e) "\\'") (cdr e)) auto-mode-alist))

  ;; Keybindings
  (bb/define-key evil-normal-state-map
    "+" 'spacemacs/evil-numbers-increase
    "_" 'spacemacs/evil-numbers-decrease
    "\\" 'evil-repeat-find-char-reverse
    "[s" (lambda (n) (interactive "p") (dotimes (c n nil) (insert " ")))
    "]s" (lambda (n) (interactive "p")
           (forward-char) (dotimes (c n nil) (insert " ")) (backward-char (1+ n))))
  (bb/define-key evil-insert-state-map
    (kbd "C-e") 'move-end-of-line
    (kbd "C-a") 'move-beginning-of-line)
  (bb/define-key evil-motion-state-map
    (kbd "<backspace>") 'helm-M-x)
  (with-eval-after-load 'helm
    (bb/define-key helm-map
      (kbd "C-S-q") 'ace-jump-helm-line-execute-action))
  (evil-leader/set-key
    "ec" 'flycheck-clear
    "os" 'just-one-space
    "ot" 'helm-etags-select
    "ov" 'evilmi-select-items
    "oh" (defun bb/highlight ()
           (interactive)
           (hlt-highlight-region)
           (keyboard-quit))
    "oH" (defun bb/unhighlight ()
           (interactive)
           (hlt-unhighlight-region)
           (keyboard-quit))
    "qw" (defun bb/maybe-quit ()
           (interactive)
           (if (cdr (visible-frame-list))
               (call-interactively 'spacemacs/frame-killer)
             (call-interactively 'spacemacs/prompt-kill-emacs))))
  (evil-leader/set-key-for-mode 'text-mode
    "m." (defun bb/empty-commit ()
           (interactive)
           (insert ".")
           (call-interactively 'with-editor-finish)))
  (bb/define-key company-active-map
    (kbd "C-w") 'evil-delete-backward-word)

  ;; Miscellaneous
  (add-hook 'text-mode-hook 'auto-fill-mode)
  (add-hook 'makefile-mode-hook 'whitespace-mode)
  (add-hook 'erc-mode-hook 'typo-mode)
  (remove-hook 'prog-mode-hook 'spacemacs//show-trailing-whitespace)

  ;; Text objects
  (spacemacs|define-text-object "/" "slash" "/" "/")
  (spacemacs|define-text-object "_" "underscore" "_" "_")
  (spacemacs|define-text-object "~" "tilde" "~" "~")
  (spacemacs|define-text-object "=" "equal" "=" "=")

  ;; Diminish
  (when (eq 'hybrid dotspacemacs-editing-style)
    (diminish 'hybrid-mode))
  (with-eval-after-load 'emoji-cheat-sheet-plus
    (diminish 'emoji-cheat-sheet-plus-display-mode))
  (unless (spacemacs/system-is-mswindows)
    (with-eval-after-load 'helm-gtags
      (diminish 'helm-gtags-mode)))

  ;; Disable smartparens highlighting
  (with-eval-after-load 'smartparens
    (show-smartparens-global-mode -1))

  ;; Semantic fucks up scrolling
  (with-eval-after-load 'semantic
    (bb/remove-from-list semantic-submode-list 'global-semantic-stickyfunc-mode))

  ;; Some fixes for comint-style buffers
  (dolist (mode '(erc-mode
                  comint-mode
                  term-mode
                  eshell-mode
                  inferior-emacs-lisp-mode))
    (bb/remove-from-list evil-insert-state-modes mode))

  (let ((comint-hooks '(eshell-mode-hook
                        term-mode-hook
                        erc-mode-hook
                        messages-buffer-mode-hook
                        comint-mode-hook)))
    (spacemacs/add-to-hooks (defun bb/no-hl-line-mode ()
                              (setq-local global-hl-line-mode nil))
                            comint-hooks)
    (spacemacs/add-to-hooks (defun bb/no-scroll-margin ()
                              (setq-local scroll-margin 0))
                            comint-hooks))
  (add-hook 'inferior-emacs-lisp-mode-hook 'smartparens-mode)

  ;; LaTeX
  (add-hook 'LaTeX-mode-hook
            (defun bb/shift-width-2 ()
              (setq-local evil-shift-width 2)))
  (setq font-latex-match-slide-title-keywords
        '(("frametitle" "{"))
        font-latex-match-function-keywords
        '(("setbeamercovered" "{")
          ("usetheme" "{")
          ("usecolortheme" "{")
          ("usetikzlibrary" "{")
          ("reserveinserts" "{")
          ("address" "{")
          ("definecolor" "{{{")
          ("includegraphics" "[{")
          ("titlegraphic" "{")
          ("newacronym" "{{{"))
        font-latex-match-textual-keywords
        '(("hfill" "" nil 'noarg)
          ("textwidth" "" nil 'noarg)
          ("titlepage" "" nil 'noarg)
          ("and" "")
          ("institute" "[{")
          ("abstract" "{")
          ("overview" "{")
          ("doList" "{")
          ("challengeList" "{")
          ("ldots" "" nil 'noarg))
        font-latex-match-reference-keywords
        '(("autoref" "{")
          ("inst" "{"))
        )

  ;; IRC
  (add-hook 'erc-insert-pre-hook
            (defun bb/erc-foolish-filter (msg)
              "Ignores messages matching `erc-foolish-content'."
              (when (erc-list-match erc-foolish-content msg)
                (setq erc-insert-this nil))))

  (defun bb/erc-github-filter ()
    "Shortens messages from gitter."
    (interactive)
    (when (and (< 18 (- (point-max) (point-min)))
               (string= (buffer-substring (point-min)
                                          (+ (point-min) 18))
                        "<gitter> [Github] "))
      (dolist (regexp '(" \\[Github\\]"
                        " \\(?:in\\|to\\) [^ /]+/[^ /:]+"))
        (goto-char (point-min))
        (when (re-search-forward regexp (point-max) t)
          (replace-match "")))
      (goto-char (point-min))
      (when (re-search-forward
             "https?://github\\.com/[^/]+/[^/]+/[^/]+/\\([[:digit:]]+\\)\\([^[:space:]]*\\)?"
             (point-max) t)
        (let* ((url (match-string 0))
               (number (match-string 1))
               (start (+ 1 (match-beginning 0)))
               (end (+ 1 (length number) start)))
          (replace-match (format "(#%s)" (match-string 1)))
          (erc-button-add-button start end 'browse-url nil (list url)))
        )))

  (with-eval-after-load 'erc
    (setq erc-insert-modify-hook
          '(erc-controls-highlight
            erc-button-add-buttons
            bb/erc-github-filter
            erc-fill
            erc-match-message
            erc-add-timestamp
            erc-hl-nicks)))

  (add-hook 'erc-mode-hook 'emoji-cheat-sheet-plus-display-mode)
  (dolist (module '(track youtube image))
    (bb/remove-from-list erc-modules module))
  (with-eval-after-load 'erc
    (erc-track-mode -1))

  (evil-leader/set-key
    "aiq" 'erc-quit-server
    "aig" (defun bb/gitter ()
            (interactive)
            (erc-tls :server "irc.gitter.im"
                     :port "6667"
                     :nick "TheBB"
                     :password bb/gitter-pwd
                     :full-name bb/full-name))
    "aif" (defun bb/freenode ()
            (interactive)
            (erc :server "irc.freenode.net"
                 :port "6667"
                 :nick "TheBB"
                 :full-name bb/full-name)))

  ;; Evilification
  (with-eval-after-load 'org-agenda
    (spacemacs|evilify-map org-agenda-mode-map
      :mode org-agenda-mode
      :bindings
      "j" 'org-agenda-next-line
      "k" 'org-agenda-previous-line
      (kbd "M-j") 'org-agenda-next-item
      (kbd "M-k") 'org-agenda-previous-item
      (kbd "M-h") 'org-agenda-earlier
      (kbd "M-l") 'org-agenda-later
      (kbd "gd") 'org-agenda-toggle-time-grid
      (kbd "gr") 'org-agenda-redo))
  (with-eval-after-load 'org
    (define-key org-read-date-minibuffer-local-map (kbd "M-h")
      (lambda () (interactive) (org-eval-in-calendar '(calendar-backward-day 1))))
    (define-key org-read-date-minibuffer-local-map (kbd "M-l")
      (lambda () (interactive) (org-eval-in-calendar '(calendar-forward-day 1))))
    (define-key org-read-date-minibuffer-local-map (kbd "M-k")
      (lambda () (interactive) (org-eval-in-calendar '(calendar-backward-week 1))))
    (define-key org-read-date-minibuffer-local-map (kbd "M-j")
      (lambda () (interactive) (org-eval-in-calendar '(calendar-forward-week 1))))
    (define-key org-read-date-minibuffer-local-map (kbd "M-H")
      (lambda () (interactive) (org-eval-in-calendar '(calendar-backward-month 1))))
    (define-key org-read-date-minibuffer-local-map (kbd "M-L")
      (lambda () (interactive) (org-eval-in-calendar '(calendar-forward-month 1))))
    (define-key org-read-date-minibuffer-local-map (kbd "M-K")
      (lambda () (interactive) (org-eval-in-calendar '(calendar-backward-year 1))))
    (define-key org-read-date-minibuffer-local-map (kbd "M-J")
      (lambda () (interactive) (org-eval-in-calendar '(calendar-forward-year 1)))))
  (with-eval-after-load 'magit
    (evil-define-key 'motion magit-mode-map (kbd "M-j") 'magit-section-forward-sibling)
    (evil-define-key 'motion magit-mode-map (kbd "M-k") 'magit-section-backward-sibling))
  (with-eval-after-load 'haskell-interactive-mode
    (spacemacs|evilify-map haskell-error-mode-map
      :mode haskell-error-mode))
  (with-eval-after-load 'proced
    (spacemacs|evilify-map proced-mode-map
      :mode proced-mode))

  ;; Safe local variables
  (put 'helm-make-build-dir 'safe-local-variable 'stringp)

  ;; Additional packages
  (use-package helm-flycheck
    :defer t
    :init
    (evil-leader/set-key "eh" 'helm-flycheck))
  (use-package help-fns+
    :commands describe-keymap
    :init
    (evil-leader/set-key "hdK" 'describe-keymap))
  (use-package helm-fuzzier
    :defer t
    :commands helm-fuzzier-mode
    :init
    (with-eval-after-load 'helm
      (helm-fuzzier-mode 1)))
  (use-package nginx-mode
    :defer t
    :mode ("nginx\\.conf\\'" "/etc/nginx/.*\\'"))
  (use-package nameless
    :defer t
    :init
    (progn
      (add-hook 'emacs-lisp-mode-hook 'nameless-mode-from-hook)
      (spacemacs|add-toggle nameless
        :status nameless-mode
        :on (nameless-mode)
        :off (nameless-mode -1)
        :evil-leader-for-mode (emacs-lisp-mode . "mo:"))))
  (use-package warnings
    :defer t
    :config
    (push '(undo discard-info) warning-suppress-types))

  ;; Workarounds

  ;; https://github.com/EphramPerdition/helm-fuzzier/issues/9
  (defun bb/helm-locate-library (orig-fn &rest args)
    (let ((fuzzy helm-fuzzier-mode))
      (prog2
          (when fuzzy (helm-fuzzier-mode -1))
          (apply orig-fn args)
        (when fuzzy (helm-fuzzier-mode 1)))))
  (advice-add 'helm-locate-library :around 'bb/helm-locate-library)

  ;; Load local
  (when (file-exists-p "~/local.el")
    (load "~/local.el"))
  )