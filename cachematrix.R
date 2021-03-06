## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        ## matrix function
        set <- function(y) {
           x <<- y
           inv <<- NULL
        }
        ## Ret. matrix function
        get <- function() x
        ## Set inverse matrix cache
        setinv <- function(minv) inv <<- minv
        ## Get cached matrix
        getinv <- function() inv
        ## Ret cached matrix
        list(set = set, get = get, 
             setinv = setinv,
             getinv = getinv)
}


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getinv()
        ## Already cached?
        if(!is.null(inv)) {
          message("getting cached matrix")
          return(inv)
        }
        ## Get matrix
        data <- x$get()
        ## Solve matrix
        inv <- solve(data, ...)
        ## Set cache
        x$setinv(inv)
        ## Return the inversed matrix
        inv
}
