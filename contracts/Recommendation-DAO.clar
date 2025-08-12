;; Recommendation DAO Contract
;; Simple DAO that stores and retrieves recommendations

;; Data storage
(define-map recommendations principal (string-ascii 200))

;; Error codes
(define-constant err-empty-input (err u100))
(define-constant err-not-found (err u101))

;; Function 1: Add a recommendation
(define-public (add-recommendation (text (string-ascii 200)))
  (begin
    (asserts! (> (len text) u0) err-empty-input)
    (map-set recommendations tx-sender text)
    (ok true)
  )
)

;; Function 2: Get a recommendation by user
(define-read-only (get-recommendation (user principal))
  (match (map-get? recommendations user)
    rec (ok rec)
    err-not-found
  )
)
