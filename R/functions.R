
base_function <- function(cmd, ...) {
  arglist <- outsider::.arglist_get(...)
  wd <- outsider::.wd_get(arglist = arglist, key = '-wd', i = 1)
  files_to_send <- outsider::.filestosend_get(arglist = arglist, wd = wd)
  arglist <- c(paste0('/PyRate/', cmd), arglist)
  arglist <- outsider::.arglist_parse(arglist = arglist,
                                      keyvals_to_drop = '-wd')
  otsdr <- outsider::.outsider_init(repo = 'dombennett/om..pyrate',
                                    cmd = 'python2.7', wd = wd,
                                    files_to_send = files_to_send,
                                    arglist = arglist)
  outsider::.run(otsdr)
}

#' @name PyRate
#' @title PyRate
#' @description Run PyRate
#' @param ... Arguments
#' @example examples/PyRate.R
#' @export
PyRate <- function(...) {
  base_function(cmd = 'PyRate.py', ...)
}

#' @name PyRateContinuous
#' @title PyRateContinuous
#' @description Run PyRateContinuous
#' @param ... Arguments
#' @example examples/PyRateContinuous.R
#' @export
PyRateContinuous <- function(...) {
  base_function(cmd = 'PyRateContinuous.py', ...)
}

#' @name PyRateContinuousShift
#' @title PyRateContinuousShift
#' @description Run PyRateContinuousShift
#' @param ... Arguments
#' @example examples/PyRateContinuousShift.R
#' @export
PyRateContinuousShift <- function(...) {
  base_function(cmd = 'PyRateContinuousShift.py', ...)
}

#' @name PyRateDES
#' @title PyRateDES
#' @description Run PyRateDES
#' @param ... Arguments
#' @example examples/PyRateDES.R
#' @export
PyRateDES <- function(...) {
  base_function(cmd = 'PyRateDES.py', ...)
}

#' @name PyRateDES2
#' @title PyRateDES2
#' @description Run PyRateDES2
#' @param ... Arguments
#' @example examples/PyRateDES2.R
#' @export
PyRateDES2 <- function(...) {
  base_function(cmd = 'PyRateDES2.py', ...)
}

#' @name PyRateMBD
#' @title PyRateMBD
#' @description Run PyRateMBD
#' @param ... Arguments
#' @example examples/PyRateMBD.R
#' @export
PyRateMBD <- function(...) {
  base_function(cmd = 'PyRateMBD.py', ...)
}

#' @name PyRateMCDD
#' @title PyRateMCDD
#' @description Run PyRateMCDD
#' @param ... Arguments
#' @example examples/PyRateMCDD.R
#' @export
PyRateMCDD <- function(...) {
  base_function(cmd = 'PyRateMCDD.py', ...)
}
