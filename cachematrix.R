## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(m = matrix()) {
  cachedInverse <- NULL

  get <- function() m  
  set <- function(sm) {
    cachedInverse <<- NULL
    m <<- sm 
  }

  getSolve <- function() cachedInverse  
  setSolve <- function(inv) cachedInverse <<- inv

  list(set = set, get = get, setSolve = setSolve, getSolve = getSolve)
}


## Write a short comment describing this function

cacheSolve <- function(m, ...) {
  solution <- m$getSolve()
  if(!is.null(solution)) {
    message("getting cached data")
    return(solution)
  }
  
  solution <- solve(m$get())
  m$setSolve(solution)
  solution
}
