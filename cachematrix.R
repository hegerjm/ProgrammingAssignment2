## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
##This function performs the following:
##1. Sets the value for the matrix
##2. Gets the value of the matrix
##3. Set the value of the inverse matrix
##4. Gets the value of the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinv <- function(solve) m <<- solve
        getinv <- function() m
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}


## Write a short comment describing this function
## The function calculates the inverse matrix of X using the solve function.  Taking advantage of R lexical scoping to see of the inverse matrix has already
## been cached.  If it is cached simply retreiving the value from a different environment

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinv()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinv(m)
        m
        
}
