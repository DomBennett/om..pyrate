# LIBS ----
library(outsider)
repo <- 'dombennett/om..pyrate..2.0'

# INSTALL ----
module_install(repo = repo)

# IMPORT PyRate ----
module_help(fname = 'PyRate', repo = repo)
PyRate <- module_import(fname = 'PyRate', repo = repo)
PyRate('-h')

# TUTORIAL SETUP ----
# See: https://github.com/dsilvestro/PyRate/blob/master/tutorials/pyrate_tutorial_1.md
canis_occ_url <- paste0('https://paleobiodb.org/data1.2/occs/list.csv?',
                        'base_name=canis&show=acconly')
utils::download.file(url = canis_occ_url, destfile = 'Canis_pbdb_data.csv')
source(paste0('https://raw.githubusercontent.com/dsilvestro/PyRate/master/',
              'pyrate_utilities.r'))
extant_dogs <- c("Canis rufus", "Canis lupus", "Canis aureus", "Canis latrans",
                 "Canis mesomelas", "Canis anthus", "Pseudalopex gymnocercus",
                 "Canis adustus", "Canis familiaris")
extract.ages.pbdb(file = "Canis_pbdb_data.csv", extant_species = extant_dogs)

# RUN ----
# check
PyRate('Canis_pbdb_data_PyRate.py', '-data_info')
PyRate('Canis_pbdb_data_PyRate.py', '-mHPP')
