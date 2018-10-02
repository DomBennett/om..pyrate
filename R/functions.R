pkgnm <- environmentName(env = environment())

#' @name pyrate
#' @title PyrRate
#' @description Run PyRate
#' @param useCPPlib Use C++ library if available, integer.
#' @param v version, logical.
#' @param seed random seed, integer.
#' @param help print help to screen, logical.
#' @param cite print PyRate citation, logical.
#' @export
pyrate <- function(input_data=NULL, useCPPlib=NULL, seed=NULL, v = FALSE,
                   help = FALSE, cite=FALSE) {
  # call PyRate with python2.7
  run <- function(...) {
    outsider::.run(pkgnm = pkgnm, 'python2.7', 'PyRate.py', ...)
  }
  # pass arguments
  if (help) {
    run('--help')
  }
  if (v) {
    run('-v')
  }
  if (cite) {
    run('-cite')
  }
  # if (!is.null(useCPPlib)) {
  #   args <- c('-useCPPlib', useCPPlib)
  # }
}
