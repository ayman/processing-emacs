;; processing-mode.el

;; Processing.org language based on Java mode. Adds keyword
;; highlighting for all recognized Processing language functions.

;; Copyright (C) 2008 Rudolf Olah <omouse@gmail.com>
;; Licensed under the GNU GPL version 3 or later

(define-derived-mode processing-mode
  java-mode "Processing"
  "Major mode for Processing.
\\{java-mode-map}")

(defconst processing-font-lock-keywords-1
  (eval-when-compile
    `(;; Shape functions
      (,(concat
	 (regexp-opt '("triangle" "line" "arc" "point" "quad" "ellipse"
		       "rect" "curve" "bezier")
		     t)
	 "(") 1 font-lock-function-name-face t)
      (,(concat
	 (regexp-opt '("strokeWeight" "smooth" "strokeJoin" "noSmooth"
		       "ellipseMode" "rectMode" "background" "stroke")
		     t)
	 "(") 1 font-lock-doc-face t)
      (,(regexp-opt '("width" "height" "frameRate" "frameCount" "noCursor()" "cursor()")
		    t)
       . font-lock-constant-face)
      (,(concat "screen." (regexp-opt '("width" "height") t))
       1 font-lock-constant-face t)
      ))
  "Subdued level highlighting for Processing mode.")

;;(defconst processing-font-lock-keywords-2
;;  (append processing-font-lock-keywords-1
;;	  (eval-when-compile
;;	    `(	    

(defvar processing-font-lock-keywords processing-font-lock-keywords-1
  "Default expressions to highlight in Processing mode.")

;; YASnippets
(if (fboundp 'yas/define-snippets)
    (yas/define-snippets
     'processing-mode
     '(
       ;; (key template name condition)
       ("tri" "triangle(${x1}, ${y1}, ${x2}, ${y2}, ${x3}, ${y3});"
	"triangle" nil)
       ("l(" "line(${x1}, ${y1}, ${x2}, ${y2});" "line 2d" nil)
       ("l(.3d" "line(${x1}, ${y1}, ${z1}, ${x2}, ${y2}, ${z2});" "line 3d" nil)
       ("arc" "arc(${x}, ${y}, ${width}, ${height}, ${start}, ${stop});" "arc" nil)
       ("p(" "point(${x}, ${y});" "point 2d" nil)
       ("p(.3d" "point(${x}, ${y}, ${z});" "point 3d" nil)
       ("quad" "quad(${x1}, ${y1}, ${x2}, ${y2}, ${x3}, ${y3}, ${x4}, ${y4});"
	"quad" nil)
       ("ell" "ellipse(${x}, ${y}, ${width}, ${height});" "ellipse" nil)
       ("rect" "rect(${x}, ${y}, ${width}, ${height});" "rect" nil)

       ;; Color
       ;;; Setting
       ("background" "background(${gray_or_color_or_hex});" "background .." nil)
       ("background.ca" "background(${gray_or_color_or_hex}, ${alpha});"
	"background .. alpha" nil)
       ("background.rgb" "background(${red}, ${green}, ${blue});" "background RGB" nil)
       ("background.rgba" "background(${red}, ${green}, ${blue}, ${alpha});"
	"background RGBA" nil)
       ("colorm" "colorMode(${RGB_or_HSV});" "color mode" nil)
       ("colorm.r" "colorMode(${RGB_or_HSV}, ${range});" "color mode range" nil)
       ("colorm.rgb" "colorMode(${RGB_or_HSV}, ${range1}, ${range2}, ${range3});"
	"color mode RGB/HSV range" nil)
       ("colorm.rgba" "colorMode(${RGB_or_HSV}, ${range1}, ${range2}, ${range3}, ${range4});"
	"color mode RGB/HSV, A range" nil)
       ("stroke" "stroke(${gray_or_color_or_hex});" "stroke .." nil)
       ("stroke.ca" "stroke(${gray_or_color_or_hex}, ${alpha});" "stroke .. alpha" nil)
       ("stroke.rgb" "stroke(${red}, ${green}, ${blue});" "stroke RGB" nil)
       ("stroke.rgba" "stroke(${red}, ${green}, ${blue}, ${alpha});" "stroke RGBA" nil)
       ("fill" "fill(${gray_or_color_or_hex});" "fill .." nil)
       ("fill.ca" "fill(${gray_or_color_or_hex}, ${alpha});" "fill .. alpha" nil)
       ("fill.rgb" "fill(${red}, ${green}, ${blue});" "fill RGB" nil)
       ("fill.rgba" "fill(${red}, ${green}, ${blue}, ${alpha});" "fill RGBA" nil)
       )
     'java-mode)
  (message "YASnippets not installed. Not defining any processing-mode snippets."))
