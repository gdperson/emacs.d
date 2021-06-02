(require 'cc-mode)
(require 'semantic)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
(global-semantic-stickyfunc-mode 1)


(semantic-mode 1)

;; (defun gdperson:ac-c-header-init()
;;   (maybe-require-package 'auto-complete)
;;   (require 'auto-complete)
;;   (require 'auto-complete-config)
;;   (ac-config-default)
;;   (maybe-require-package 'auto-complete-c-headers)
;;   (require 'auto-complete-c-headers)
;;   (add-to-list 'ac-sources 'ac-source-c-headers)
;;   (add-to-list 'achead:include-directories '"/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/12.0.0/include")
;;   )

(defun mac-sematic-hook ()
  (semantic-add-system-include "/usr/local/include" 'c-mode)
  (semantic-add-system-include "/usr/local/include" 'c++-mode)
  (semantic-add-system-include "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include" 'c-mode)
  (semantic-add-system-include "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include" 'c++-mode)
  (semantic-add-system-include "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include" 'c-mode)
  (semantic-add-system-include "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include" 'c++-mode)
  (semantic-add-system-include "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/12.0.0/include" 'c-mode)
  (semantic-add-system-include "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/12.0.0/include" 'c++-mode)
  )

(defun alexott/cedet-hook ()
  (local-set-key "\C-c\C-j" 'semantic-ia-fast-jump)
  (local-set-key "\C-c\C-s" 'semantic-ia-show-summary)
  (local-set-key "\C-c\C-f" 'ff-find-other-file))

(when *is-a-mac*
  (mac-sematic-hook)
  ; Fix iedit bug in Mac
  (define-key global-map (kbd "C-c ;") 'iedit-mode)
  )
(add-hook 'c-mode-common-hook 'alexott/cedet-hook)
(add-hook 'c-mode-hook 'alexott/cedet-hook)
(add-hook 'c++-mode-hook 'alexott/cedet-hook)
;; (add-hook 'c-mode-hook 'gdperson:ac-c-header-init)
;; (add-hook 'c++-mode-hook 'gdperson:ac-c-header-init)

;; Enable EDE only in C/C++
(require 'ede)
(global-ede-mode)

(provide 'init-cedet)
