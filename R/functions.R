pkgnm <- environmentName(env = environment())

#' @name pyrate
#' @title PyrRate
#' @description Run PyRate
#' @param help
#' @export
pyrate <- function(help = TRUE) {
  ids <- outsider:::ids_get(pkgnm = pkgnm)
  ids <- c('img_id' = 'pyrate', 'cntnr_id' = 'pyrate_1')
  # launch container
  outsider:::docker_start(cntnr_id = ids[['cntnr_id']],
                          img_id = ids[['img_id']])
  on.exit(outsider:::docker_stop(cntnr_id = ids[['cntnr_id']]))
  # run command
  invisible(outsider:::docker_exec(cntnr_id = ids[['cntnr_id']], 'python2.7',
                                   'PyRate.py', '--help'))
}

