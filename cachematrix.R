## Below are two functions provided to cache matrix inversion, every time if you want to
## calculate the inverse matrix of x, first pass x through makecachematrix function,
## store the value, then pass the cached value to cachesolve to get the inverse matrix of x

## This function provides a list containing four functions, do some pretreatment for
## Second function

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y){
        x <- y
        inv <- NULL}
    get <- function(){
        x}
    getinv <- function(){
        inv}    
    setinv <- function(invmatrix){
        inv <<- invmatrix}
    list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## This function checks if the input haven't change, if changed, calculate as usual
## If it changed, pullthe value from cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    output <- x$getinv()
    if(!is.null(output)){
        message("getting cached data")
        return (output)
    }
    data <- x$get()
    output <- solve(data, ...)
    x$setinv(output)
    output
}
