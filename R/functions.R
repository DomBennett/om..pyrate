pkgnm <- environmentName(env = environment())

#' @name PyRate
#' @title PyRate
#' @description Run PyRate
#' @param h show this help message and exit
#' @param v show program's version number and exit
#' @param seed -1 random seed
#' @param useCPPlib 1 Use C++ library if available (boolean)
#' @param cite print PyRate citation
#' @param j 1 number of data set in input file
#' @param trait 1 number of trait for Cov model
#' @param logT 0 Transform trait (or rates for -plotRJ): 0) False, 1)
#' Ln(x), 2) Log10(x)
#' @param N N number of exant species
#' @param wd WD path to working directory
#' @param out OUT output tag
#' @param singleton 0 Remove singletons (min no. occurrences)
#' @param frac_sampled_singleton 0 Random fraction of singletons not removed
#' @param rescale 1 Rescale data (e.g. -rescale 1000: 1 -> 1000,
#' time unit = 1Ky)
#' @param translate 0 Shift data (e.g. -translate 10: 1My -> 10My)
#' @param d <input file> Load SE table
#' @param clade -1 clade analyzed (set to -1 to analyze all species)
#' @param trait_file <input file> Load trait table
#' @param restore_mcmc <input file> Load mcmc.log file
#' @param filter inf inf Filter lineages with all occurrences within time range
#' @param filter_taxa taxa_file Filter lineages within list (drop all others)
#' @param initDiv 0 Number of initial lineages (option only available with
#' -d SE_table or -fixSE)
#' @param PPmodeltest Likelihood testing among preservation models
#' @param log_marginal_rates -1 0) save summary file, default for -A 4; 1)
#' save marginal rate file, default for -A 0,2
#' @param tree Tree file (NEXUS format)
#' @param sampling 1.0 Taxon sampling (phylogeny)
#' @param bdc Run BDC:Compatible model
#' @param eqr Run BDC:Equal rate model
#' @param plot <input file> RTT plot (type 1): provide path to
#' 'marginal_rates.log' files or 'marginal_rates' file
#' @param plot2 <input file> RTT plot (type 2): provide path to
#' 'marginal_rates.log' files or 'marginal_rates' file
#' @param plot3 <input file> RTT plot for fixed number of shifts:
#' provide 'mcmc.log' file
#' @param plotRJ <input file> RTT plot for runs with '-log_marginal_rates 0':
#' provide path to 'mcmc.log' files
#' @param grid_plot 1.0 Plot resolution in Myr (only for plot3 and plotRJ
#' commands)
#' @param root_plot 0 User-defined root age for RTT plots
#' @param tag <*tag*.log> Tag identifying files to be combined and
#' plotted (-plot and -plot2) or summarized in SE table (-ginput)
#' @param ltt 0 1) Plot lineages-through-time; 2) plot Log10(LTT)
#' @param mProb MPROB Input 'mcmc.log' file
#' @param BF <2 input files> [<2 input files> ...] Input
#' 'marginal_likelihood.txt' files
#' @param data_info Summary information about an input data
#' @param SE_stats <extinction rate at the present, bin_size, #_simulations>
#' [<extinction rate at the present, bin_size, #_simulations> ...] Calculate
#' and plot stats from SE table: -ginput <path_to_mcmc.log> generate SE table
#' from *mcmc.log files
#' @param combLog <path_to_log_files> Combine (and resample) log files
#' @param resample 0 Number of samples for each log file (-combLog). Use 0 to
#' keep all samples.
#' @param col_tag column names [column names ...] Columns to be combined using
#' combLog
#' @param check_names <*_SpeciesList.txt file> Automatic check for typos in
#' taxa names (provide SpeciesList file)
#' @param reduceLog <*_mcmc.log file> Reduce file size (mcmc.log) to quickly
#' assess convergence
#' @param n 10000000 mcmc generations
#' @param s 1000 sample freq.
#' @param p 1000 print freq.
#' @param b 0 burnin
#' @param thread 4 4 no. threads used for BD and NHPP likelihood respectively
#' (set to 0 to bypass multi-threading)
#' @param A 4 0) parameter estimation, 1) marginal likelihood, 2) BDMCMC, 3)
#' DPP, 4) RJMCMC
#' @param use_DA Use data augmentation for NHPP likelihood opf extant taxa
#' @param r 1 MC3 - no. MCMC chains
#' @param t 0.03 MC3 - temperature
#' @param sw 100 MC3 - swap frequency
#' @param M 10 BDMCMC/RJMCMC - frequency of model update
#' @param B 1 BDMCMC - birth rate
#' @param T 1.0 BDMCMC - time of model update
#' @param S 1000 BDMCMC - start model update
#' @param k 10 TI - no. scaling factors
#' @param a 0.3 TI - shape beta distribution
#' @param dpp_f 500 DPP - frequency
#' @param dpp_hp 2.0 DPP - shape of gamma HP on concentration parameter
#' @param dpp_eK 2.0 DPP - expected number of rate categories
#' @param dpp_grid 1.5 DPP - size of time bins
#' @param dpp_nB 0 DPP - number of time bins
#' @param rj_pr 1 RJ - proposal (0: Gamma, 1: Weighted mean)
#' @param rj_Ga 1.5 RJ - shape of gamma proposal (if rj_pr 0)
#' @param rj_Gb 3.0 RJ - rate of gamma proposal (if rj_pr 0)
#' @param rj_beta 10 RJ - shape of beta multiplier (if rj_pr 1)
#' @param rj_dm 0 RJ - allow double moves (0: no, 1: yes)
#' @param rj_bd_shift 0.5 RJ - 0: only sample shifts in speciation; 1:
#' only sample shifts in extinction
#' @param se_gibbs Use aprroximate S/E Gibbs sampler
#' @param pL 1.1 1.1 Prior - speciation rate (Gamma <shape, rate>) |
#' (if shape=n,rate=0 -> rate estimated)
#' @param pM 1.1 1.1 Prior - extinction rate (Gamma <shape, rate>) |
#' (if shape=n,rate=0 -> rate estimated)
#' @param pP 1.5 1.5 Prior - preservation rate (Gamma <shape, rate>) |
#' (if shape=n,rate=0 -> rate estimated)
#' @param pS 2.5 Prior - time frames (Dirichlet <shape>)
#' @param pC 1 Prior - Covar parameters (Normal <standard deviation>) |
#' (if pC=0 -> sd estimated)
#' @param cauchy -1 -1 Prior - use hyper priors on sp/ex rates
#' (if 0 -> estimated)
#' @param mHPP Model - Homogeneous Poisson process of preservation
#' @param mL 1 Model - no. (starting) time frames (speciation)
#' @param mM 1 Model - no. (starting) time frames (extinction)
#' @param mC Model - constrain time frames (l,m)
#' @param mCov 0 COVAR model: 1) speciation, 2) extinction, 3) speciation &
#' extinction, 4) preservation, 5) speciation & extinction & preservation
#' @param mG Model - Gamma heterogeneity of preservation rate
#' @param mPoiD Poisson-death diversification model
#' @param mDeath Pure-death model
#' @param mBDI -1 BDI sub-model - 0) birth-death, 1) immigration-death
#' @param ncat 4 Model - Number of categories for Gamma heterogeneity
#' @param fixShift <input file> Input tab-delimited file
#' @param qShift <input file> Poisson process of preservation with shifts
#' (Input tab-delimited file)
#' @param fixSE <input file> Input mcmc.log file
#' @param ADE 0 ADE model: 0) no age dependence 1) estimated age dep
#' @param discrete Discrete-trait-dependent BD model (requires -trait_file)
#' @param twotrait Discrete-trait-dependent extinction + Covar
#' @param bound 0 0 Bounded BD model
#' @param edgeShift 0 0 Fixed times of shifts at the edges (when -mL/-mM > 3)
#' @param qFilter 1 if set to zero all shifts in preservation rates are kept,
#' even if outside observed timerange
#' @param tT 1.0 Tuning - window size (ts, te)
#' @param nT 5 Tuning - max number updated values (ts, te)
#' @param tQ TQ TQ Tuning - window sizes (q/alpha: 1.2 1.2)
#' @param tR 1.2 Tuning - window size (rates)
#' @param tS 1.0 Tuning - window size (time of shift)
#' @param fR 0.5 Tuning - fraction of updated values (rates)
#' @param fS 0.7 Tuning - fraction of updated values (shifts)
#' @param fQ 0.5 Tuning - fraction of updated values (q rates, TPP)
#' @param tC TC TC TC Tuning - window sizes cov parameters (l,m,q)
#' @param fU FU FU FU Tuning - update freq. (q: .02, l/m: .18, cov: .08)
#' @param multiR 1 Tuning - Proposals for l/m: 0) sliding win 1) muliplier
#' @param tHP THP THP Tuning - window sizes hyperpriors on l and m 
#' @export
PyRate <- function(h=FALSE, v=FALSE, seed=NULL, useCPPlib=NULL, cite=FALSE,
                   j=NULL, trait=NULL, logT=NULL, N=NULL, wd=NULL, out=NULL,
                   singleton=NULL, frac_sampled_singleton=NULL, rescale=NULL,
                   translate=NULL, d=NULL, clade=NULL, trait_file=NULL,
                   restore_mcmc=NULL, filter=NULL, filter_taxa=NULL,
                   initDiv=NULL, PPmodeltest=NULL, log_marginal_rates=NULL,
                   tree=NULL, sampling=NULL, bdc=NULL, eqr=NULL, plot=NULL,
                   plot2=NULL, plot3=NULL, plotRJ=NULL, grid_plot=NULL,
                   root_plot=NULL, tag=NULL, ltt=NULL, mProb=NULL, BF=NULL,
                   data_info=NULL, SE_stats=NULL, combLog=NULL, resample=NULL,
                   col_tag=NULL, check_names=NULL, reduceLog=NULL, n=NULL,
                   s=NULL, p=NULL, b=NULL, thread=NULL, A=NULL, use_DA=NULL,
                   r=NULL, t=NULL, sw=NULL, M=NULL, B=NULL, T=NULL, S=NULL,
                   k=NULL, a=NULL, dpp_f=NULL, dpp_hp=NULL, dpp_eK=NULL,
                   dpp_grid=NULL, dpp_nB=NULL, rj_pr=NULL, rj_Ga=NULL,
                   rj_Gb=NULL, rj_beta=NULL, rj_dm=NULL, rj_bd_shift=NULL,
                   se_gibbs=NULL, pL=NULL, pM=NULL, pP=NULL, pS=NULL, pC=NULL,
                   cauchy=NULL, mHPP=NULL, mL=NULL, mM=NULL, mC=NULL, mCov=NULL,
                   mG=NULL, mPoiD=NULL, mDeath=NULL, mBDI=NULL, ncat=NULL,
                   fixShift=NULL, qShift=NULL, fixSE=NULL, ADE=NULL,
                   discrete=NULL, twotrait=NULL, bound=NULL, edgeShift=NULL,
                   qFilter=NULL, tT=NULL, nT=NULL, tQ=NULL, tR=NULL, tS=NULL,
                   fR=NULL, fS=NULL, fQ=NULL, tC=NULL, fU=NULL, multiR=NULL,
                   tHP=NULL) {
  # call PyRate with python2.7
  run <- function(args) {
    outsider::.run(pkgnm = pkgnm, 'python2.7', 'PyRate.py', args)
  }
  # pass arguments
  passed_args <- as.list(match.call())[-1]
  args <- NULL
  for (i in seq_along(passed_args)) {
    if (is.logical(passed_args[[i]]) && passed_args[[i]]) {
      args <- c(paste0('-', names(passed_args)[i]))
    } else {
      args <- c(paste0('-', names(passed_args)[i]), passed_args[[i]])
    }
  }
  run(args)
}
