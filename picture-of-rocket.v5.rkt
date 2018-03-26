; imports
(require 2htdp/image)
(require 2htdp/universe)

; consts
(define CANVAS_HEIGHT 400)
(define CANVAS_H_CENTER 150)
(define CANVAS_WIDTH (* 2 CANVAS_H_CENTER))
(define CANVAS (empty-scene CANVAS_WIDTH CANVAS_HEIGHT))
(define ROCKET .)
(define ROCKET_CENTER_TO_TOP
  (- CANVAS_HEIGHT (/ (image-height ROCKET) 2))
)

; functions
(define (picture-of-rocket.v5 height)
  (cond
    [(<= height ROCKET_CENTER_TO_TOP)
     (place-image ROCKET CANVAS_H_CENTER height CANVAS)
    ]
    [(> height ROCKET_CENTER_TO_TOP)
     (place-image ROCKET CANVAS_H_CENTER ROCKET_CENTER_TO_TOP CANVAS)
    ]
  )
)

(animate picture-of-rocket.v5)
