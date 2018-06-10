(define (char-value c)
  (cond
    [(string=? c "I") 1]
    [(string=? c "V") 5]
    [(string=? c "X") 10]
    [(string=? c "L") 50]
    [(string=? c "C") 100]
    [(string=? c "D") 500]
    [(string=? c "M") 1000]
  )
)

(define (string-length-dec s amount)
  (- (string-length s) amount)
)

(define (latin-to-number s)
  (if (> (string-length s) 1)
      (if (>= (char-value (string-ith s (string-length-dec s 2))) (char-value (string-ith s (string-length-dec s 1))) )
          (+
              (char-value (string-ith s (string-length-dec s 1)))
              (latin-to-number (substring s 0 (string-length-dec s 1)))
          )
          (+
              (-
                  (char-value (string-ith s (string-length-dec s 1)))
                  (char-value (string-ith s (string-length-dec s 2)))           
              )
              (if (> (string-length-dec s 2) 0)
                  (latin-to-number (substring s 0 (string-length-dec s 2)))
                  0
              )
          )
      )
      (char-value s)
  )
)

(check-expect (latin-to-number "I") 1)
(check-expect (latin-to-number "III") 3)
(check-expect (latin-to-number "IV") 4)
(check-expect (latin-to-number "V") 5)
(check-expect (latin-to-number "VIII") 8)
(check-expect (latin-to-number "IX") 9)
(check-expect (latin-to-number "XVIII") 18)
(check-expect (latin-to-number "XIX") 19)
(check-expect (latin-to-number "XXXIX") 39)
(check-expect (latin-to-number "XLIV") 44)
(check-expect (latin-to-number "XLIX") 49)
(check-expect (latin-to-number "LVII") 57)
(check-expect (latin-to-number "LXXIX") 79)
(check-expect (latin-to-number "MDCCLXXVI") 1776)
(check-expect (latin-to-number "MCMLIV") 1954)
(check-expect (latin-to-number "MCMXC") 1990)
(check-expect (latin-to-number "MMXIV") 2014)
