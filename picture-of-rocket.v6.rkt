; imports
(require 2htdp/image)
(require 2htdp/universe)

; consts
(define CANVAS_HEIGHT 200)
(define CANVAS_H_CENTER 150)
(define CANVAS_WIDTH (* 2 CANVAS_H_CENTER))
(define CANVAS (empty-scene CANVAS_WIDTH CANVAS_HEIGHT))
(define ROCKET .)
(define ROCKET_CENTER_ON_GROUND
  (- CANVAS_HEIGHT (/ (image-height ROCKET) 2))
)

; velocity
(define V 3)

; functions
(define (distance t)
  (* V t)
)

(define (picture-of-rocket.v6 time)
  (cond
    [(<= (distance time) ROCKET_CENTER_ON_GROUND)
     (place-image ROCKET CANVAS_H_CENTER (distance time) CANVAS)
    ]
    [(> (distance time) ROCKET_CENTER_ON_GROUND)
     (place-image ROCKET CANVAS_H_CENTER ROCKET_CENTER_ON_GROUND CANVAS)
    ]
  )
)

(animate picture-of-rocket.v6)
