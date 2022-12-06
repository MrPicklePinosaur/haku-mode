
(defvar haku-mode-hook nil)

(defvar haku-mode-map
  (let ((map (make-keymap))) map)
)

(add-to-list 'auto-mode-alist '("\\.haku\\'" . haku-mode))

; syntax highlighting
(defconst haku-mode-lock-keywords
  (list
   '("\\(註.*\\)" . font-lock-comment-face)
   '("\\(「.*」\\)" . font-lock-string-face)
   '("\\(０\\|１\\|２\\|３\\|４\\|５\\|６\\|７\\|８\\|９\\|0\\|1\\|2\\|3\\|4\\|5\\|6\\|7\\|8\\|9\\|一\\|二\\|三\\|四\\|五\\|六\\|七\\|八\\|九\\|十\\|百\\|千\\|万\\|億\\|兆\\|京\\|垓\\|𥝱\\|穣\\|溝\\|澗\\|正\\|載\\|極\\|○\\|零\\|ゼロ\\|マル]+\\)" . font-lock-constant-face)
   '("\\(一線\\|値\\|入\\|入力\\|全線\\|写像\\|合\\|尻尾\\|探索\\|書\\|正引\\|正引き\\|消\\|濾\\|畳\\|見\\|読\\|逆\\|逆な\\|鍵\\|長さ\\|閉\\|開\\|頭\\)" . font-lock-function-name-face)
   '("\\(和\\|差\\|積\\|除\\|足\\|引\\|掛\\|割\\|等しい\\|より多い\\|より少ない\\)" . font-lock-builtin-face)
   '("\\(もし\\|若し\\|なら\\|ならば\\|ですけれども\\|ですけれど\\|ですけど\\|ですが\\|そうでない\\|そうでなければ\\|そうでないなら\\|場合は\\)" . font-lock-keyword-face)
   '("\\([ァアィイゥウェエォオカガキギクグケゲコゴサザシジスズセゼソゾタダチヂッツヅテデトドナニヌネノハバパヒビピフブプヘベペホボポマミムメモャヤュユョヨラリルレロヮワヰヱヲンヴヵヶヷヸヹヺ・ーヽヾヿ]+\\)". font-lock-variable-name-face)
   )
  "Minial syntax highlighting for haku"
)
(defvar haku-font-lock-keywords haku-mode-lock-keywords "Default highlighting for haku mode")

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
