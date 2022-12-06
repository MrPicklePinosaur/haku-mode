
(defvar haku-mode-hook nil)

(defvar haku-mode-map
  (let ((map (make-keymap))) map)
)

(add-to-list 'auto-mode-alist '("\\.haku\\'" . haku-mode))

; syntax highlighting
(defconst haku-mode-lock-keywords
  (list
   '("\\(本\\)". font-lock-builtin-face)
   '("\\([ァアィイゥウェエォオカガキギクグケゲコゴサザシジスズセゼソゾタダチヂッツヅテデトドナニヌネノハバパヒビピフブプヘベペホボポマミムメモャヤュユョヨラリルレロヮワヰヱヲンヴヵヶヷヸヹヺ・ーヽヾヿ]+\\)". font-lock-variable-name-face)
   )
  "Minial syntax highlighting for haku"
)
(defvar haku-font-lock-keywords haku-mode-lock-keywords "Default highlighting for haku mode")
;; (regexp-opt '() t) 

; register mode
(defun haku-mode ()
  "Major mode that provides syntax highlighting for the haku language"
  (interactive)
  (kill-all-local-variables)
  (use-local-map haku-mode-map)
  (set (make-local-variable 'font-lock-defaults) '(haku-font-lock-keywords))
  (setq major-mode 'haku-mode)
  (setq mode-name "haku")
  (run-hooks 'haku-mode-hook)
  )
(provide 'haku-mode)
