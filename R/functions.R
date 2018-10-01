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
pyrate <- function(input_data=NULL, useCPPlib=NULL, seed=NULL, v = FALSE, help = FALSE, cite=FALSE) {
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
  if (!is.null(useCPPlib)) {
    args <- c('-useCPPlib', useCPPlib)
  }
}

p.add_argument('input_data', metavar='<input file>', type=str,help='Input python file - see template',default=[],nargs='*')
p.add_argument('-j',         type=int, help='number of data set in input file', default=1, metavar=1)
p.add_argument('-trait',     type=int, help='number of trait for Cov model', default=1, metavar=1)
p.add_argument('-logT',      type=int, help='Transform trait (or rates for -plotRJ): 0) False, 1) Ln(x), 2) Log10(x)', default=0, metavar=0)
p.add_argument("-N",         type=float, help='number of exant species') 
p.add_argument("-wd",        type=str, help='path to working directory', default="")
p.add_argument("-out",       type=str, help='output tag', default="")
p.add_argument('-singleton', type=float, help='Remove singletons (min no. occurrences)', default=0, metavar=0)
p.add_argument('-frac_sampled_singleton', type=float, help='Random fraction of singletons not removed', default=0, metavar=0)
p.add_argument("-rescale",   type=float, help='Rescale data (e.g. -rescale 1000: 1 -> 1000, time unit = 1Ky)', default=1, metavar=1)
p.add_argument("-translate", type=float, help='Shift data (e.g. -translate 10: 1My -> 10My)', default=0, metavar=0)
p.add_argument('-d',         type=str,help="Load SE table",metavar='<input file>',default="")
p.add_argument('-clade',     type=int, help='clade analyzed (set to -1 to analyze all species)', default=-1, metavar=-1)
p.add_argument('-trait_file',type=str,help="Load trait table",metavar='<input file>',default="")
p.add_argument('-restore_mcmc',type=str,help="Load mcmc.log file",metavar='<input file>',default="")
p.add_argument('-filter',     type=float,help="Filter lineages with all occurrences within time range ",default=[inf,0], metavar=inf, nargs=2)
p.add_argument('-filter_taxa',type=str,help="Filter lineages within list (drop all others) ",default="", metavar="taxa_file")
p.add_argument('-initDiv',    type=int, help='Number of initial lineages (option only available with -d SE_table or -fixSE)', default=0, metavar=0)
p.add_argument('-PPmodeltest',help='Likelihood testing among preservation models', action='store_true', default=False)
p.add_argument('-log_marginal_rates',type=int,help='0) save summary file, default for -A 4; 1) save marginal rate file, default for -A 0,2 ', default=-1,metavar=-1)
# phylo test
p.add_argument('-tree',       type=str,help="Tree file (NEXUS format)",default="", metavar="")
p.add_argument('-sampling',   type=float,help="Taxon sampling (phylogeny)",default=1., metavar=1.)
p.add_argument('-bdc',      help='Run BDC:Compatible model', action='store_true', default=False)
p.add_argument('-eqr',      help='Run BDC:Equal rate model', action='store_true', default=False)

# PLOTS AND OUTPUT
p.add_argument('-plot',       metavar='<input file>', type=str,help="RTT plot (type 1): provide path to 'marginal_rates.log' files or 'marginal_rates' file",default="")
p.add_argument('-plot2',      metavar='<input file>', type=str,help="RTT plot (type 2): provide path to 'marginal_rates.log' files or 'marginal_rates' file",default="")
p.add_argument('-plot3',      metavar='<input file>', type=str,help="RTT plot for fixed number of shifts: provide 'mcmc.log' file",default="")
p.add_argument('-plotRJ',      metavar='<input file>', type=str,help="RTT plot for runs with '-log_marginal_rates 0': provide path to 'mcmc.log' files",default="")
p.add_argument('-grid_plot',  type=float, help='Plot resolution in Myr (only for plot3 and plotRJ commands)', default=1., metavar=1.)
p.add_argument('-root_plot',  type=float, help='User-defined root age for RTT plots', default=0, metavar=0)
p.add_argument('-tag',        metavar='<*tag*.log>', type=str,help="Tag identifying files to be combined and plotted (-plot and -plot2) or summarized in SE table (-ginput)",default="")
p.add_argument('-ltt',        type=int,help='1) Plot lineages-through-time; 2) plot Log10(LTT)', default=0, metavar=0)
p.add_argument('-mProb',      type=str,help="Input 'mcmc.log' file",default="")
p.add_argument('-BF',         type=str,help="Input 'marginal_likelihood.txt' files",metavar='<2 input files>',nargs='+',default=[])
p.add_argument("-data_info",  help='Summary information about an input data', action='store_true', default=False)
p.add_argument('-SE_stats',   type=str,help="Calculate and plot stats from SE table:",metavar='<extinction rate at the present, bin_size, #_simulations>',nargs='+',default=[])
p.add_argument('-ginput',     type=str,help='generate SE table from *mcmc.log files', default="", metavar="<path_to_mcmc.log>")
p.add_argument('-combLog',    type=str,help='Combine (and resample) log files', default="", metavar="<path_to_log_files>")
p.add_argument('-resample',   type=int,help='Number of samples for each log file (-combLog). Use 0 to keep all samples.', default=0, metavar=0)
p.add_argument('-col_tag',    type=str,help='Columns to be combined using combLog', default=[], metavar="column names",nargs='+')
p.add_argument('-check_names',type=str,help='Automatic check for typos in taxa names (provide SpeciesList file)', default="", metavar="<*_SpeciesList.txt file>")
p.add_argument('-reduceLog',  type=str,help='Reduce file size (mcmc.log) to quickly assess convergence', default="", metavar="<*_mcmc.log file>")

# MCMC SETTINGS
p.add_argument('-n',      type=int, help='mcmc generations',default=10000000, metavar=10000000)
p.add_argument('-s',      type=int, help='sample freq.', default=1000, metavar=1000)
p.add_argument('-p',      type=int, help='print freq.',  default=1000, metavar=1000)
p.add_argument('-b',      type=float, help='burnin', default=0, metavar=0)
p.add_argument('-thread', type=int, help='no. threads used for BD and NHPP likelihood respectively (set to 0 to bypass multi-threading)', default=[0,0], metavar=4, nargs=2)

# MCMC ALGORITHMS
p.add_argument('-A',        type=int, help='0) parameter estimation, 1) marginal likelihood, 2) BDMCMC, 3) DPP, 4) RJMCMC', default=4, metavar=4)
p.add_argument("-use_DA",   help='Use data augmentation for NHPP likelihood opf extant taxa', action='store_true', default=False)
p.add_argument('-r',        type=int,   help='MC3 - no. MCMC chains', default=1, metavar=1)
p.add_argument('-t',        type=float, help='MC3 - temperature', default=.03, metavar=.03)
p.add_argument('-sw',       type=float, help='MC3 - swap frequency', default=100, metavar=100)
p.add_argument('-M',        type=int,   help='BDMCMC/RJMCMC - frequency of model update', default=10, metavar=10)
p.add_argument('-B',        type=int,   help='BDMCMC - birth rate', default=1, metavar=1)
p.add_argument('-T',        type=float, help='BDMCMC - time of model update', default=1.0, metavar=1.0)
p.add_argument('-S',        type=int,   help='BDMCMC - start model update', default=1000, metavar=1000)
p.add_argument('-k',        type=int,   help='TI - no. scaling factors', default=10, metavar=10)
p.add_argument('-a',        type=float, help='TI - shape beta distribution', default=.3, metavar=.3)
p.add_argument('-dpp_f',    type=float, help='DPP - frequency ', default=500, metavar=500)
p.add_argument('-dpp_hp',   type=float, help='DPP - shape of gamma HP on concentration parameter', default=2., metavar=2.)
p.add_argument('-dpp_eK',   type=float, help='DPP - expected number of rate categories', default=2., metavar=2.)
p.add_argument('-dpp_grid', type=float, help='DPP - size of time bins',default=1.5, metavar=1.5)
p.add_argument('-dpp_nB',   type=float, help='DPP - number of time bins',default=0, metavar=0)
p.add_argument('-rj_pr',       type=float, help='RJ - proposal (0: Gamma, 1: Weighted mean) ', default=1, metavar=1)
p.add_argument('-rj_Ga',       type=float, help='RJ - shape of gamma proposal (if rj_pr 0)', default=1.5, metavar=1.5)
p.add_argument('-rj_Gb',       type=float, help='RJ - rate of gamma proposal (if rj_pr 0)',  default=3., metavar=3.)
p.add_argument('-rj_beta',     type=float, help='RJ - shape of beta multiplier (if rj_pr 1)',default=10, metavar=10)
p.add_argument('-rj_dm',       type=float, help='RJ - allow double moves (0: no, 1: yes)',default=0, metavar=0)
p.add_argument('-rj_bd_shift', type=float, help='RJ - 0: only sample shifts in speciation; 1: only sample shifts in extinction',default=0.5, metavar=0.5)
p.add_argument('-se_gibbs',    help='Use aprroximate S/E Gibbs sampler', action='store_true', default=False)

# PRIORS
p.add_argument('-pL',      type=float, help='Prior - speciation rate (Gamma <shape, rate>) | (if shape=n,rate=0 -> rate estimated)', default=[1.1, 1.1], metavar=1.1, nargs=2)
p.add_argument('-pM',      type=float, help='Prior - extinction rate (Gamma <shape, rate>) | (if shape=n,rate=0 -> rate estimated)', default=[1.1, 1.1], metavar=1.1, nargs=2)
p.add_argument('-pP',      type=float, help='Prior - preservation rate (Gamma <shape, rate>) | (if shape=n,rate=0 -> rate estimated)', default=[1.5, 1.1], metavar=1.5, nargs=2)
p.add_argument('-pS',      type=float, help='Prior - time frames (Dirichlet <shape>)', default=2.5, metavar=2.5)
p.add_argument('-pC',      type=float, help='Prior - Covar parameters (Normal <standard deviation>) | (if pC=0 -> sd estimated)', default=1, metavar=1)
p.add_argument("-cauchy",  type=float, help='Prior - use hyper priors on sp/ex rates (if 0 -> estimated)', default=[-1, -1], metavar=-1, nargs=2)

# MODEL
p.add_argument("-mHPP",    help='Model - Homogeneous Poisson process of preservation', action='store_true', default=False)
#p.add_argument("-TPP_model",help='Model - Poisson process of preservation with shifts', action='store_true', default=False)
p.add_argument('-mL',      type=int, help='Model - no. (starting) time frames (speciation)', default=1, metavar=1)
p.add_argument('-mM',      type=int, help='Model - no. (starting) time frames (extinction)', default=1, metavar=1)
p.add_argument('-mC',      help='Model - constrain time frames (l,m)', action='store_true', default=False)
p.add_argument('-mCov',    type=int, help='COVAR model: 1) speciation, 2) extinction, 3) speciation & extinction, 4) preservation, 5) speciation & extinction & preservation', default=0, metavar=0)
p.add_argument("-mG",      help='Model - Gamma heterogeneity of preservation rate', action='store_true', default=False)
p.add_argument('-mPoiD',   help='Poisson-death diversification model', action='store_true', default=False)
p.add_argument('-mDeath',  help='Pure-death model', action='store_true', default=False)
p.add_argument("-mBDI",    type=int, help='BDI sub-model - 0) birth-death, 1) immigration-death', default=-1, metavar=-1)
p.add_argument("-ncat",    type=int, help='Model - Number of categories for Gamma heterogeneity', default=4, metavar=4)
p.add_argument('-fixShift',metavar='<input file>', type=str,help="Input tab-delimited file",default="")
p.add_argument('-qShift',  metavar='<input file>', type=str,help="Poisson process of preservation with shifts (Input tab-delimited file)",default="")
p.add_argument('-fixSE',   metavar='<input file>', type=str,help="Input mcmc.log file",default="")
p.add_argument('-ADE',     type=int, help='ADE model: 0) no age dependence 1) estimated age dep', default=0, metavar=0)
p.add_argument('-discrete',help='Discrete-trait-dependent BD model (requires -trait_file)', action='store_true', default=False)
p.add_argument('-twotrait',help='Discrete-trait-dependent extinction + Covar', action='store_true', default=False)
p.add_argument('-bound',   type=float, help='Bounded BD model', default=[np.inf, 0], metavar=0, nargs=2)
p.add_argument('-edgeShift',type=float, help='Fixed times of shifts at the edges (when -mL/-mM > 3)', default=[np.inf, 0], metavar=0, nargs=2)
p.add_argument('-qFilter', type=int, help='if set to zero all shifts in preservation rates are kept, even if outside observed timerange', default=1, metavar=1)


# TUNING
p.add_argument('-tT',     type=float, help='Tuning - window size (ts, te)', default=1., metavar=1.)
p.add_argument('-nT',     type=int,   help='Tuning - max number updated values (ts, te)', default=5, metavar=5)
p.add_argument('-tQ',     type=float, help='Tuning - window sizes (q/alpha: 1.2 1.2)', default=[1.2,1.2], nargs=2)
p.add_argument('-tR',     type=float, help='Tuning - window size (rates)', default=1.2, metavar=1.2)
p.add_argument('-tS',     type=float, help='Tuning - window size (time of shift)', default=1., metavar=1.)
p.add_argument('-fR',     type=float, help='Tuning - fraction of updated values (rates)', default=.5, metavar=.5)
p.add_argument('-fS',     type=float, help='Tuning - fraction of updated values (shifts)', default=.7, metavar=.7)
p.add_argument('-fQ',     type=float, help='Tuning - fraction of updated values (q rates, TPP)', default=.5, metavar=.5)
p.add_argument('-tC',     type=float, help='Tuning - window sizes cov parameters (l,m,q)', default=[.2, .2, .15], nargs=3)
p.add_argument('-fU',     type=float, help='Tuning - update freq. (q: .02, l/m: .18, cov: .08)', default=[.02, .18, .08], nargs=3)
p.add_argument('-multiR', type=int,   help='Tuning - Proposals for l/m: 0) sliding win 1) muliplier ', default=1, metavar=1)
p.add_argument('-tHP', type=float, help='Tuning - window sizes hyperpriors on l and m', default=[1.2, 1.2], nargs=2)

