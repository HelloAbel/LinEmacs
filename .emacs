(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))
(require 'init)
;;(require 'auto-complete)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (badwolf)))
 '(custom-safe-themes
   (quote
	("174502267725776b47bdd2d220f035cae2c00c818765b138fea376b2cdc15eb6" default)))
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "等距更紗黑體 HC" :foundry "????" :slant normal :weight semi-bold :height 143 :width normal)))))
