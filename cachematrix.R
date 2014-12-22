## If the contents of a matrix is not changing, it may make sense to cache the value of the inverse 
## so that when we need it again, it can be looked up in the cache rather than recomputed. 

# Example use:
# > m=matrix(c(0.8,0.5,0.2,05),2,2)
# > y<-makeCacheMatrix(m)
# > y$get()
# [,1] [,2]
# [1,]  0.8  0.2
# [2,]  0.5  5.0
# > cacheSolve(y)
# > y$getinverse()
# [,1]        [,2]
# [1,]  1.2820513 -0.05128205
# [2,] -0.1282051  0.20512821

## makeCacheMatrix function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) i <<- inverse
    getinverse <- function() i
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)    
}


## cacheSolve function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), 
## then the cachesolve retrieves the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    i <- x$getinverse()
    if(!is.null(i)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    i <- solve(data, ...)
    x$setinverse(i)
    i
}
