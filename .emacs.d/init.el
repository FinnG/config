(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(company-idle-delay 0)
 '(custom-safe-themes
   (quote
    ("b7b2cd8c45e18e28a14145573e84320795f5385895132a646ff779a141bbda7e" "bc40f613df8e0d8f31c5eb3380b61f587e1b5bc439212e03d4ea44b26b4f408a" "badc4f9ae3ee82a5ca711f3fd48c3f49ebe20e6303bba1912d4e2d19dd60ec98" "b809c70eeba09728804ebfbd16bf40f408c1dbe751b94330ff9e8d14a77b3370" "a25c42c5e2a6a7a3b0331cad124c83406a71bc7e099b60c31dc28a1ff84e8c04" "12b4427ae6e0eef8b870b450e59e75122d5080016a9061c9696959e50d578057" "4f5bb895d88b6fe6a983e63429f154b8d939b4a8c581956493783b2515e22d6d" "94ba29363bfb7e06105f68d72b268f85981f7fba2ddef89331660033101eb5e5" "2e5705ad7ee6cfd6ab5ce81e711c526ac22abed90b852ffaf0b316aa7864b11f" "3b24f986084001ae46aa29ca791d2bc7f005c5c939646d2b800143526ab4d323" "90d329edc17c6f4e43dbc67709067ccd6c0a3caa355f305de2041755986548f2" "05c3bc4eb1219953a4f182e10de1f7466d28987f48d647c01f1f0037ff35ab9a" "282606e51ef2811142af5068bd6694b7cf643b27d63666868bc97d04422318c1" "a041a61c0387c57bb65150f002862ebcfe41135a3e3425268de24200b82d6ec9" "0251780e8e79d2a5e75eec7ee3b6c646b882495cb884d9dd32f30c60f9d65db6" default)))
 '(fill-column 80)
 '(gdb-non-stop-setting nil)
 '(ggtags-oversize-limit 1024)
 '(ggtags-use-sqlite3 t)
 '(global-company-mode t)
 '(global-semantic-stickyfunc-mode t)
 '(inhibit-startup-screen t)
 '(magit-log-arguments (quote ("--graph" "--decorate")))
 '(package-selected-packages
   (quote
    (company-jedi leuven-theme soothe-theme gruvbox-theme jinja2-mode fireplace moe-theme white-sand-theme nyan-mode helm-spotify powerline ample-theme seti-theme isearch-prop isearch+ wiki-nav php-mode flatui-theme helm-gtags stickyfunc-enhance zenburn-theme sublimity multiple-cursors monokai-theme markdown-mode+ magit icicles helm-swoop grin ggtags flappymacs f ein company column-marker circe auto-complete-clang atom-dark-theme)))
 '(semantic-mode nil)
 '(truncate-lines t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Add some package archives to the Emacs package manager
(require 'package)
(package-initialize)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))


;; Switch on Helm, do some config, and replace the built in Emacs menus with the
;; Helm equivalents
(require 'helm-config)
(helm-mode 1)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-z")  'helm-select-action)
(setq helm-buffers-fuzzy-matching           t
      helm-move-to-line-cycle-in-source     t
      helm-ff-search-library-in-sexp        t
      helm-scroll-amount                    8
      helm-ff-file-name-history-use-recentf t)

;; Switch to my preferred theme of the moment
;;(load-theme 'soothe)

;; Get rid of the standard Emacs toolbars
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Turn on code completion and code searching
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'c-mode-common-hook
	  (lambda ()
	    (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1))))

;; Set up some nice keybindings for convenience
(global-set-key (kbd "C-#") 'mc/mark-next-like-this)
(global-set-key (kbd "M-n") 'next-error)
(global-set-key (kbd "M-p") 'previous-error)
(global-set-key (kbd "C-<return>") 'company-complete)
(global-set-key (kbd "M-i") 'helm-swoop)
(global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
(global-set-key (kbd "<f5>")  'compile)
(global-set-key (kbd "<C-escape>") 'config)

;; set up some window move keybindings
(windmove-default-keybindings 'meta)

;; auto load files when they change
(global-auto-revert-mode t)

;; Fix horrible GNU coding style and change indentation level to 4 also NO TABS
(setq c-default-style "linux"
      c-basic-offset 4)
(setq-default indent-tabs-mode nil)
(c-set-offset 'inline-open '0)

;; Highlight column 80 (it would be nice to have this turned on... but it's sloooow)
;(add-hook 'c-mode-hook (lambda () (column-marker-1 80)))
;(set-face-attribute 'column-marker-1  nil :background "light coral")

;; set font size to 8pt
(set-face-attribute 'default nil :height 80)
(set-face-font 'default "Monospace")


;; magit options
(setq magit-last-seen-setup-instructions "1.4.0")

;; scroll compilation output
(setq compilation-scroll-output 1)

;; Enable yasnippet for tab completion of if/while/etc.
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)


;; Other miscellaneous config
(setq org-clock-persist 'history)
(setq org-clock-idle-time 10)
(org-clock-persistence-insinuate)

(defun find-file-at-point-with-line ()
  "Opens the file at point and goes to line-number."
  (interactive)
  (let ((fname (ffap-file-at-point)))
    (if fname
      (let ((line
             (save-excursion
               (goto-char (cadr ffap-string-at-point-region))
               (and (re-search-backward ":\\([0-9]+\\)"
                                        (line-beginning-position) t)
                    (string-to-int (match-string 1))))))
        ;; (message "file:%s,line:%s" fname line)
        (when (and (tramp-tramp-file-p default-directory)
                   (= ?/ (aref fname 0)))
          ;; if fname is an absolute path in remote machine, it will not return a tramp path,fix it here.
          (let ((pos (position ?: default-directory)))
            (if (not pos) (error "failed find first tramp indentifier ':'"))
            (setf pos (position ?: default-directory :start (1+ pos)))
            (if (not pos) (error "failed find second tramp indentifier ':'"))
            (setf fname (concat (substring default-directory 0 (1+ pos)) fname))))
        (message "fname:%s" fname)
        (find-file-existing fname)
        (when line (goto-line line)))
      (error "File does not exist."))))

(defun overnight-results ()
  (interactive)  
  (switch-to-buffer "*overnight results*")
  (erase-buffer)
  (start-process "overnights" "*overnight results*" "ssh" "gregjules@vm-overlord" "/home/gfg/Work/git/undo-code/scripts/overnight-compare.py" "history" "--fails" "0")
  (switch-to-buffer "*overnight results*"))
  
(show-paren-mode 1)
(setq show-paren-priority -50) ; without this matching parens aren't highlighted in region
(setq show-paren-delay 0)

;; Replace the \emsp\emsp with something nicer to read.
;;
(defun dpj-org-clocktable-indent-string (level)
  (if (= level 1)
      ""
    (let ((str " "))
      (while (> level 2)
        (setq level (1- level)
              str (concat str "----")))
      (concat str "--> "))))
(advice-add 'org-clocktable-indent-string :override #'dpj-org-clocktable-indent-string)

(put 'erase-buffer 'disabled nil)

(defun temp-buff ()
  (interactive)
  (switch-to-buffer (make-temp-name "scratch")))

(defun netcat-to-point (port)
  "Starts a netcat server that blocks until it receives some
input. Once input is recieved it is inserted to the current
buffer at the point. Can be cancelled at any time using the
function `keyboard-quit'.

PORT specifies the network port to listen on."
  (interactive "nport:")
  (message (format "Listening for netcat input on port %d" port))
  (call-process "nc" nil (current-buffer) nil "-l" "-p" (format "%d" port)))

(defun netcat-from-region (host port)
  "This function takes the current region, and transmits it to a
listening netcat server. If called interactively, this function
prompts for the HOST and PORT parameters.

HOST specifies the hostname or IP address of the netcat server.
PORT specifies the network port to use."
  (interactive "shostname:\nnport:")
  (call-process-region (point) (mark) "nc" nil 0 nil host (format "%d" port)))

(defun netcat-from-buffer (host port)
  "This function takes the current buffer, and transmits it to a
listening netcat server. If called interactively, this function
prompts for the HOST and PORT parameters.

HOST specifies the hostname or IP address of the netcat server.
PORT specifies the network port to use."
  (interactive "shostname:\nnport:")
  (save-excursion (call-process-region (beginning-of-buffer) (end-of-buffer)
                                       "nc" nil 0 nil host (format "%d" port))))

;; (eval-after-load "gdb-mi"
;;   '(defun gdb-setup-windows ()
;;      "Layout the window pattern for option `gdb-many-windows'."
;;      (gdb-get-buffer-create 'gdb-locals-buffer)
;;      (gdb-get-buffer-create 'gdb-stack-buffer)
;;      (gdb-get-buffer-create 'gdb-breakpoints-buffer)
;;      (set-window-dedicated-p (selected-window) nil)
;;      (switch-to-buffer gud-comint-buffer)
;;      (delete-other-windows)
;;      (let ((win0 (selected-window))
;;            (win1 (split-window nil ( / ( * (window-height) 3) 4)))
;;            (win2 (split-window nil ( / (window-height) 3)))
;;            (win3 (split-window-right)))
;;        (gdb-set-window-buffer (gdb-locals-buffer-name) nil win3)
;;        (select-window win2)
;;        (set-window-buffer
;;         win2
;;         (if gud-last-last-frame
;;             (gud-find-file (car gud-last-last-frame))
;;           (if gdb-main-file
;;               (gud-find-file gdb-main-file)
;;             ;; Put buffer list in window if we
;;             ;; can't find a source file.
;;             (list-buffers-noselect))))
;;        (setq gdb-source-window (selected-window))
;;        (let ((win4 (split-window-right)))
;;          (gdb-set-window-buffer
;;           (gdb-get-buffer-create 'gdb-disassembly-buffer) nil win4)
;;          (select-window win4)
;;          (gdb-set-window-buffer
;;           (gdb-get-buffer-create 'gdb-inferior-io) nil (split-window-below)))
       
;;        (select-window win1)
;;        (gdb-set-window-buffer (gdb-stack-buffer-name))
;;        (let ((win6 (split-window-right)))
;;          (gdb-set-window-buffer (if gdb-show-threads-by-default
;;                                     (gdb-threads-buffer-name)
;;                                   (gdb-breakpoints-buffer-name))
;;                                 nil win6))
;;        (select-window win0))))

(defun writing-mode ()
    "TODO"
    (interactive)
    (delete-other-windows)
    (visual-line-mode)
    (split-window-right)
    (split-window-right)
    (other-window 1)
    (follow-mode)
    (other-window 1)
    (follow-mode)
    (split-window-right)
    (other-window 2))

(defun config ()
  "Open up the ~/.emacs.d/init.el file"
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun demo-mode ()
  (interactive)
  (set-face-attribute 'default nil :height 140))
