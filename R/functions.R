pkgnm <- environmentName(env = environment())

base_function <- function(cmd, ...) {
  args <- outsider::.args_parse()
  # remove cmd from args
  args <- args[-1]
  # wd is determined either by -wd or the location of the input file
  if ('-wd' %in% args) {
    wd_i <- which(args == '-wd')
    wd <- args[wd_i + 1]
    # if wd is specified, then drop from args
    args <- args[-1 * c(wd_i, wd_i + 1)]
  } else {
    wd <- sub(pattern = basename(args[1]), replacement = .Platform$file.sep,
              x = args[1])
    if (wd == .Platform$file.sep) {
      wd <- getwd()
    }
  }
  files_to_send <- outsider::.which_args_are_filepaths(args, wd)
  args <- c(paste0('/PyRate/', cmd), outsider::.to_basename(args))
  outsider::.run(pkgnm = pkgnm, files_to_send = files_to_send, dest = wd, 
                 cmd = 'python2.7', args = args)
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
