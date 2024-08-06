;; Declare variables
(declare-var @thr2__errorflag i16); output
;; Declare threads
;; -----------------------------------------
;; Declare major thread
;; -----------------------------------------

(declare-thread major thr2__thr2proc)
(invoke-parameters major repeated 40 priority 2)
;
(post-condition major (assert(= @thr2__errorflag #x0000)))
(end-thread major) 
;; -----------------------------------------
;; Declare minor thread
;; -----------------------------------------
(declare-thread minor thr1__thr1proc) ; param name entry_function
(invoke-parameters minor repeated 20 priority 1)

(end-thread major)
;
