(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))
;;; Always do syntax highlighting  
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(package-initialize)
;; 将包管理器的源换成清华大学的镜像
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/") t)
(add-to-list 'package-archives '("elpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/") t)
;; 包管理器初始化
(package-initialize)
;; 定义要安装的软件列表
(defvar xzh/packages '(
					   badwolf-theme
					   company
					   company-c-headers
					   company-irony
					   company-irony-c-headers
					   company-jedi
					   counsel-gtags
					   diminish
					   doom-modeline
					   flycheck
					   ggtags
					   grip-mode
					   gtags
					   hungry-delete
					   imenu-list
					   irony
					   lua-mode
					   markdown-mode
					   markdown-mode+
					   quickrun
					   smex
					   treemacs
					   ) "Default packages")
;; 防止被autoremove删除
(setq package-selected-packages xzh/packages)
;; 检查默认安装的软件是否都已安装
;; loop需要common lisp包
(require 'cl)
(defun xzh/packages-installed-p ()
  (loop for pkg in xzh/packages
		when (not (package-installed-p pkg)) do (return nil)
		finally (return t)))
;; 如果没有都安装则进行自动安装
(unless (xzh/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg xzh/packages)
	(when (not (package-installed-p pkg))
	  (package-install pkg))))

;; 为打开配置文件绑定快捷键
(defun open-my-init-elisp ()
	(interactive)
  (find-file "~/.emacs.d/lisp/init.el"))
(global-set-key (kbd "<f2>") 'open-my-init-elisp)

;; 配置hungry-delete
(require 'hungry-delete)
(global-hungry-delete-mode)

;; 配置smex来增强M-x体验
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
;;(global-set-key (kbd "M-x") 'smex-major-mode-commands)

;; 设置在emacs打开scheme解释器为chezscheme
(global-font-lock-mode 1)  
;;; Also highlight parens  
(setq show-paren-delay 0 
show-paren-style 'parenthesis)  
(show-paren-mode 1)  
;;; This is the binary name of my scheme implementation  
(setq scheme-program-name "chezscheme")

;; 绑定elisp下自动补全快捷键
(global-set-key "\C-c\ \C-e" 'company-elisp)

;; 打开最近文件
(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-items 20)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; 设置显示行号
(global-linum-mode t)
(setq linum-format "%d ")

;; 不显示欢迎屏幕
(setq inhibit-startup-message t) 
(setq gnus-inhibit-startup-message t) 

;; 设置缩进
(add-hook 'c-mode-common-hook
          '(lambda()
             (c-set-style "cc-mode")))
(setq-default tab-width 4)
(setq indent-tabs-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (wombat)))
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "等距更紗黑體 HC" :foundry "????" :slant normal :weight semi-bold :height 143 :width normal)))))

;;(setenv "GTAGSLIBPATH" (concat "/usr/include"
;;":"))
;;(setenv "MAKEOBJDIRPREFIX" (file-truename "~/obj/"))
;;(setq company-backends '((company-dabbrev-code company-gtags)))
;;(setq tab-always-indent t)
;;(add-hook 'c++-mode-hook 'global-company-mode)
;;(setq-default indent-tabs-mode  nil)
;;(add-hook 'after-init-hook'global-company-mode)

;;设置默认全屏


;; 显示括号匹配
(show-paren-mode t)
(setq show-paren-style 'parentheses)
;; 语法高亮
(global-font-lock-mode t)
;; 以 y/n代表 yes/no
(fset 'yes-or-no-p 'y-or-n-p)
;; 支持emacs和外部程序的粘贴
(setq x-select-enable-clipboard t)
;; 在标题栏提示打开文件的绝对路径
(setq frame-title-format '("xzh@" (buffer-file-name "%f" (dired-directory dired-directory "%b"))))
;; 设置假期，在日历中可以看到
(setq calendar-holidays '((holiday-chinese 1 1 "春节")
                          (holiday-chinese 1 15 "元宵节")
                          (holiday-fixed 3 8 "妇女节")
                          (holiday-fixed 4 5 "清明节")
                          (holiday-fixed 5 1 "劳动节")
                          (holiday-fixed 6 1 "儿童节")
                          (holiday-chinese 5 5 "端午节")
                          (holiday-chinese 7 7 "七夕节")
                          (holiday-chinese 7 15 "鬼节")
                          (holiday-chinese 8 15 "中秋节")
                          (holiday-chinese 9 9 "重阳节")
                          (holiday-fixed 10 1 "国庆节")
                          (holiday-chinese 9 16 "我的生日")))
;; 显示所在的函数名
(which-function-mode 1)
;; 找不到函数时显示undefined
(setq which-func-unknown "undefined")

;; 自动补全
;; (require 'init-auto-complete)
(require 'irony)
(require 'company-irony-c-headers)
(eval-after-load 'company
  '(add-to-list
    'company-backends '(company-irony-c-headers company-irony)))
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c++-mode-hook 'company-mode)
(add-to-list 'auto-mode-alist '("\\.cpp\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.c\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cc\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.hh\\'" . c++-mode))
(setq c-default-style "k&r"
      c-basic-offset 4)
(add-hook 'after-init-hook'global-company-mode)
;; python自动补全
(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))
(add-hook 'python-mode-hook 'my/python-mode-hook)

(provide 'init)
;; 使用doom-modeine显示底边栏
(require 'doom-modeline)
(doom-modeline-mode 1)

;; Lua配置
(add-to-list 'load-path "/home/johanan/.emacs.d/elpa/lua-mode-20200405.1305/lua-mode.el")
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
(setq lua-indent-level 4)

;; 配置函数定义跳转
;;(require 'ggtags)

;; 高亮当前光标所在的行
(global-hl-line-mode t)
