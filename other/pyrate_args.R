pyrate_args <- "

                  PyRate - v2.0 - 20180817

Bayesian estimation of origination,
extinction and preservation rates
from fossil occurrence data        

pyrate.help@gmail.com



Module FastPyRateC was loaded.
usage: PyRate.py [-h] [-v] [-seed -1] [-useCPPlib 1] [-cite] [-j 1] [-trait 1]
[-logT 0] [-N N] [-wd WD] [-out OUT] [-singleton 0]
[-frac_sampled_singleton 0] [-rescale 1] [-translate 0]
[-d <input file>] [-clade -1] [-trait_file <input file>]
[-restore_mcmc <input file>] [-filter inf inf]
[-filter_taxa taxa_file] [-initDiv 0] [-PPmodeltest]
[-log_marginal_rates -1] [-tree] [-sampling 1.0] [-bdc]
[-eqr] [-plot <input file>] [-plot2 <input file>]
[-plot3 <input file>] [-plotRJ <input file>] [-grid_plot 1.0]
[-root_plot 0] [-tag <*tag*.log>] [-ltt 0] [-mProb MPROB]
[-BF <2 input files> [<2 input files> ...]] [-data_info]
[-SE_stats <extinction rate at the present, bin_size, #_simulations> [<extinction rate at the present, bin_size, #_simulations> ...]]
[-ginput <path_to_mcmc.log>] [-combLog <path_to_log_files>]
[-resample 0] [-col_tag column names [column names ...]]
[-check_names <*_SpeciesList.txt file>]
[-reduceLog <*_mcmc.log file>] [-n 10000000] [-s 1000]
[-p 1000] [-b 0] [-thread 4 4] [-A 4] [-use_DA] [-r 1]
[-t 0.03] [-sw 100] [-M 10] [-B 1] [-T 1.0] [-S 1000] [-k 10]
[-a 0.3] [-dpp_f 500] [-dpp_hp 2.0] [-dpp_eK 2.0]
[-dpp_grid 1.5] [-dpp_nB 0] [-rj_pr 1] [-rj_Ga 1.5]
[-rj_Gb 3.0] [-rj_beta 10] [-rj_dm 0] [-rj_bd_shift 0.5]
[-se_gibbs] [-pL 1.1 1.1] [-pM 1.1 1.1] [-pP 1.5 1.5]
[-pS 2.5] [-pC 1] [-cauchy -1 -1] [-mHPP] [-mL 1] [-mM 1]
[-mC] [-mCov 0] [-mG] [-mPoiD] [-mDeath] [-mBDI -1] [-ncat 4]
[-fixShift <input file>] [-qShift <input file>]
[-fixSE <input file>] [-ADE 0] [-discrete] [-twotrait]
[-bound 0 0] [-edgeShift 0 0] [-qFilter 1] [-tT 1.0] [-nT 5]
[-tQ TQ TQ] [-tR 1.2] [-tS 1.0] [-fR 0.5] [-fS 0.7] [-fQ 0.5]
[-tC TC TC TC] [-fU FU FU FU] [-multiR 1] [-tHP THP THP]
[<input file> [<input file> ...]]

positional arguments:
<input file>          Input python file - see template

optional arguments:
-h, --help            show this help message and exit
-v                    show program's version number and exit
-seed -1              random seed
-useCPPlib 1          Use C++ library if available (boolean)
-cite                 print PyRate citation
-j 1                  number of data set in input file
-trait 1              number of trait for Cov model
-logT 0               Transform trait (or rates for -plotRJ): 0) False, 1)
Ln(x), 2) Log10(x)
-N N                  number of exant species
-wd WD                path to working directory
-out OUT              output tag
-singleton 0          Remove singletons (min no. occurrences)
-frac_sampled_singleton 0
Random fraction of singletons not removed
-rescale 1            Rescale data (e.g. -rescale 1000: 1 -> 1000, time unit
                                    = 1Ky)
-translate 0          Shift data (e.g. -translate 10: 1My -> 10My)
-d <input file>       Load SE table
-clade -1             clade analyzed (set to -1 to analyze all species)
-trait_file <input file>
  Load trait table
-restore_mcmc <input file>
  Load mcmc.log file
-filter inf inf       Filter lineages with all occurrences within time range
-filter_taxa taxa_file
Filter lineages within list (drop all others)
-initDiv 0            Number of initial lineages (option only available with
                                                  -d SE_table or -fixSE)
-PPmodeltest          Likelihood testing among preservation models
-log_marginal_rates -1
0) save summary file, default for -A 4; 1) save
marginal rate file, default for -A 0,2
-tree                 Tree file (NEXUS format)
-sampling 1.0         Taxon sampling (phylogeny)
-bdc                  Run BDC:Compatible model
-eqr                  Run BDC:Equal rate model
-plot <input file>    RTT plot (type 1): provide path to
'marginal_rates.log' files or 'marginal_rates' file
-plot2 <input file>   RTT plot (type 2): provide path to
'marginal_rates.log' files or 'marginal_rates' file
-plot3 <input file>   RTT plot for fixed number of shifts: provide
'mcmc.log' file
-plotRJ <input file>  RTT plot for runs with '-log_marginal_rates 0':
  provide path to 'mcmc.log' files
-grid_plot 1.0        Plot resolution in Myr (only for plot3 and plotRJ
                                              commands)
-root_plot 0          User-defined root age for RTT plots
-tag <*tag*.log>      Tag identifying files to be combined and plotted
(-plot and -plot2) or summarized in SE table (-ginput)
-ltt 0                1) Plot lineages-through-time; 2) plot Log10(LTT)
-mProb MPROB          Input 'mcmc.log' file
-BF <2 input files> [<2 input files> ...]
Input 'marginal_likelihood.txt' files
-data_info            Summary information about an input data
-SE_stats <extinction rate at the present, bin_size, #_simulations> [<extinction rate at the present, bin_size, #_simulations> ...]
Calculate and plot stats from SE table:
  -ginput <path_to_mcmc.log>
  generate SE table from *mcmc.log files
-combLog <path_to_log_files>
  Combine (and resample) log files
-resample 0           Number of samples for each log file (-combLog). Use 0
to keep all samples.
-col_tag column names [column names ...]
Columns to be combined using combLog
-check_names <*_SpeciesList.txt file>
  Automatic check for typos in taxa names (provide
                                           SpeciesList file)
-reduceLog <*_mcmc.log file>
  Reduce file size (mcmc.log) to quickly assess
convergence
-n 10000000           mcmc generations
-s 1000               sample freq.
-p 1000               print freq.
-b 0                  burnin
-thread 4 4           no. threads used for BD and NHPP likelihood
respectively (set to 0 to bypass multi-threading)
-A 4                  0) parameter estimation, 1) marginal likelihood, 2)
BDMCMC, 3) DPP, 4) RJMCMC
-use_DA               Use data augmentation for NHPP likelihood opf extant
taxa
-r 1                  MC3 - no. MCMC chains
-t 0.03               MC3 - temperature
-sw 100               MC3 - swap frequency
-M 10                 BDMCMC/RJMCMC - frequency of model update
-B 1                  BDMCMC - birth rate
-T 1.0                BDMCMC - time of model update
-S 1000               BDMCMC - start model update
-k 10                 TI - no. scaling factors
-a 0.3                TI - shape beta distribution
-dpp_f 500            DPP - frequency
-dpp_hp 2.0           DPP - shape of gamma HP on concentration parameter
-dpp_eK 2.0           DPP - expected number of rate categories
-dpp_grid 1.5         DPP - size of time bins
-dpp_nB 0             DPP - number of time bins
-rj_pr 1              RJ - proposal (0: Gamma, 1: Weighted mean)
-rj_Ga 1.5            RJ - shape of gamma proposal (if rj_pr 0)
-rj_Gb 3.0            RJ - rate of gamma proposal (if rj_pr 0)
-rj_beta 10           RJ - shape of beta multiplier (if rj_pr 1)
-rj_dm 0              RJ - allow double moves (0: no, 1: yes)
-rj_bd_shift 0.5      RJ - 0: only sample shifts in speciation; 1: only
sample shifts in extinction
-se_gibbs             Use aprroximate S/E Gibbs sampler
-pL 1.1 1.1           Prior - speciation rate (Gamma <shape, rate>) | (if
                                                                       shape=n,rate=0 -> rate estimated)
-pM 1.1 1.1           Prior - extinction rate (Gamma <shape, rate>) | (if
                                                                       shape=n,rate=0 -> rate estimated)
-pP 1.5 1.5           Prior - preservation rate (Gamma <shape, rate>) | (if
                                                                         shape=n,rate=0 -> rate estimated)
-pS 2.5               Prior - time frames (Dirichlet <shape>)
-pC 1                 Prior - Covar parameters (Normal <standard deviation>)
| (if pC=0 -> sd estimated)
-cauchy -1 -1         Prior - use hyper priors on sp/ex rates (if 0 ->
                                                                 estimated)
-mHPP                 Model - Homogeneous Poisson process of preservation
-mL 1                 Model - no. (starting) time frames (speciation)
-mM 1                 Model - no. (starting) time frames (extinction)
-mC                   Model - constrain time frames (l,m)
-mCov 0               COVAR model: 1) speciation, 2) extinction, 3)
speciation & extinction, 4) preservation, 5)
speciation & extinction & preservation
-mG                   Model - Gamma heterogeneity of preservation rate
-mPoiD                Poisson-death diversification model
-mDeath               Pure-death model
-mBDI -1              BDI sub-model - 0) birth-death, 1) immigration-death
-ncat 4               Model - Number of categories for Gamma heterogeneity
-fixShift <input file>
  Input tab-delimited file
-qShift <input file>  Poisson process of preservation with shifts (Input
                                                                   tab-delimited file)
-fixSE <input file>   Input mcmc.log file
-ADE 0                ADE model: 0) no age dependence 1) estimated age dep
-discrete             Discrete-trait-dependent BD model (requires
                                                         -trait_file)
-twotrait             Discrete-trait-dependent extinction + Covar
-bound 0 0            Bounded BD model
-edgeShift 0 0        Fixed times of shifts at the edges (when -mL/-mM > 3)
-qFilter 1            if set to zero all shifts in preservation rates are
kept, even if outside observed timerange
-tT 1.0               Tuning - window size (ts, te)
-nT 5                 Tuning - max number updated values (ts, te)
-tQ TQ TQ             Tuning - window sizes (q/alpha: 1.2 1.2)
-tR 1.2               Tuning - window size (rates)
-tS 1.0               Tuning - window size (time of shift)
-fR 0.5               Tuning - fraction of updated values (rates)
-fS 0.7               Tuning - fraction of updated values (shifts)
-fQ 0.5               Tuning - fraction of updated values (q rates, TPP)
-tC TC TC TC          Tuning - window sizes cov parameters (l,m,q)
-fU FU FU FU          Tuning - update freq. (q: .02, l/m: .18, cov: .08)
-multiR 1             Tuning - Proposals for l/m: 0) sliding win 1)
muliplier
-tHP THP THP          Tuning - window sizes hyperpriors on l and m
"


arg_lines <- strsplit(x = pyrate_args, split = '\n-')[[1]][-1]
args <- sub(pattern = '\\s.*$', replacement = '', x = arg_lines)

function_args <- paste0('function(', paste0(paste0(args, '=NULL'),
                                            collapse = ', '), ')')
document_args <- gsub(pattern = '(\\s{2,}|\n)', replacement = ' ', arg_lines)
document_args <- paste0("#' @param ", document_args)
document_args <- paste0(document_args, collapse = '\n')
cat(document_args)

descriptions <- sub(pattern = '')
defaults <- sub(pattern = '^-[^ ]+', replacement = '', x = arg_lines)
defaults <- sub(pattern = '\\s{2,}.*', replacement = '', x = defaults)
defaults <- sub(pattern = '^\\s', replacement = '', x = defaults)
length(args)
length(defaults)
x <- args[[3]]

