library(outsider)
repo <- 'dombennett/om..pyrate..2.0'
dockerfile_url <- paste0('https://raw.githubusercontent.com/', repo,
                         '/master/Dockerfile')
outsider::.docker_build(img_id = outsider::.repo_to_img(repo),
                        url = dockerfile_url)
pyrate <- module_import(fname = 'PyRate', repo = 'dombennett/om..pyrate..2.0')
module_help(fname = 'PyRate', repo = 'dombennett/om..pyrate..2.0')
pyrate('-h')
pyrate <- module_import(fname = 'PyRateDES',
                        repo = 'dombennett/om..pyrate..2.0')
pyrate('-h')
