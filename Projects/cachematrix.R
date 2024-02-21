## Two functions that cache the inverse of a matrix
## Open MASS library which calcuates the inverse of squared/non-squared matrices
library(MASS)
## This function creates a special "matrix" object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
  ## Initialize the inverse property
  i <- NULL
  ## Method to set the matrix
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  ## Method the get the matrix
  get <- function()x  
  ## Method to set the inverse of the matrix
  setInverse <- function(inverse) {
    i <<- inverse
  }
  ## Method to get the inverse of the matrix
  getInverse <- function() {
    ## Return the inverse property
    inver<-ginv(x)
    inver%*%x
  }
  ## Return a list of the methods
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}

## This function computes the inverse of a special "matrix" returned
## by makeCacheMatrix above
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i <- x$getInverse()
  
  ## Just return the inverse if its already set
  if(!is.null(i) ) {
    message("getting cached data")
    return(i)
  }
  
  ## Get the matrix from our object
  data <- x$get()
  
  ## Calculate the inverse using matrix multiplication
  i <- solve(data, ...)
  
  ## Set the inverse to the object
  x$setInverse(i)
  
  ## Return the matrix
  i
}


