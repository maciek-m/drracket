; imports
(require 2htdp/image)
(require 2htdp/universe)

; consts
(define CANVAS_HEIGHT 200)
(define CANVAS_H_CENTER 150)
(define CANVAS_WIDTH (* 2 CANVAS_H_CENTER))

(define ROCK_BED_HEIGHT 20)
(define ROCK_BED (rectangle CANVAS_WIDTH ROCK_BED_HEIGHT "solid" "gray"))

(define EMPTY_CANVAS (empty-scene CANVAS_WIDTH CANVAS_HEIGHT "blue"))
(define CANVAS (place-image ROCK_BED CANVAS_H_CENTER (- CANVAS_HEIGHT (/ ROCK_BED_HEIGHT 2)) EMPTY_CANVAS) )

(define UFO
  (overlay (circle 10 "solid" "green")
           (rectangle 40 4 "solid" "green")
  )
 )

(define UFO_CENTER_GROUND_POS
  (- CANVAS_HEIGHT (/ (image-height UFO) 2) ROCK_BED_HEIGHT )
)

; functions
(define (picture-of-rocket.v5 height)
  (cond
    [(<= height UFO_CENTER_GROUND_POS)
     (place-image UFO CANVAS_H_CENTER height CANVAS)
    ]
    [(> height UFO_CENTER_GROUND_POS)
     (place-image UFO CANVAS_H_CENTER UFO_CENTER_GROUND_POS CANVAS)
    ]
  )
)

(animate picture-of-rocket.v5)
