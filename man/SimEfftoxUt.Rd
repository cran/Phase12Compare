% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/SimEfftoxUt.R
\name{SimEfftoxUt}
\alias{SimEfftoxUt}
\title{Simulates trial replications from the Efftox model with utility optimality function.}
\usage{
SimEfftoxUt(
  NSims,
  Dose,
  PE,
  PT,
  corET,
  Nmax,
  cohort,
  UT,
  CutE,
  CutT,
  AcceptE,
  AcceptT,
  HypermeansEFF,
  HypervarsEFF
)
}
\arguments{
\item{NSims}{Number of trial simulations to run.}

\item{Dose}{Logarithm of raw dose levels - the average logarithm of the raw dose levels.}

\item{PE}{True efficacy probability for each dose.}

\item{PT}{True toxicity probaiblity for each dose.}

\item{corET}{Correlation parameter between efficacy and toxicity probability.}

\item{Nmax}{Maximum trial sample size.}

\item{cohort}{Patient cohort size.}

\item{UT}{Utility matrix for the four bivariate (efficacy, toxicity) events.}

\item{CutE}{Cutoff for efficacy probability acceptability. Dose-efficacy probabilities must be larger than this for patient assignment.}

\item{CutT}{Cutoff for toxicity probability acceptability. Dose-toxicity probabilities must be smaller than this for patient assignment.}

\item{AcceptE}{Posterior probability threshold for efficacy acceptability.}

\item{AcceptT}{Posterior probability threshold for toxicity acceptability.}

\item{HypermeansEFF}{Hypermeans for the Efftox model. In order, entries are hypermeans for (beta_{0,E},beta_{1,E},beta_{2,E},beta_{0,T},beta_{1,T},psi).}

\item{HypervarsEFF}{Hypervariances for the Efftox model. In order, entries are hypervariances for (beta_{0,E},beta_{1,E},beta_{2,E},beta_{0,T},beta_{1,T},psi).}
}
\value{
A list with the first entry corresponding to a matrix with: (1) True toxicity probabilities at each dose, (2) True efficacy probabilities at each dose, (3) True mean utility of each dose, (4) Optimal dose selection probability, (5) Average sample size of patients treated at each dose. The second entry of the list contains a vector with rows corresponding to (1) the true binary bivariate correlation between efficacy and toxicity, (2) Stopping probability of the trial, (3) Average number of efficacy events, (4) Average number of toxicity events, and (5) Delta.
}
\description{
Simulates replications from a Bayesian adaptive phase 12 clinical trial design using the Efftox model and a optimality function based on mean utility. Does not assign patient cohorts to unacceptably toxic or inefficous dose levels.
}
\examples{
library(mvtnorm)
##True toxicity probability
PT=c(.05,.10,.15,.20,.30)
##True Efficacy Probability
PE=c(.2,.4,.6,.65,.7)
#True Correlation
corET=.5
##Number of simulations
NSims=1 ##Increase this when using
##Hypermeans and hypervariances
HypermeansEFF = c(.022,3.45,0,-4.23,3.1,0)
HypervarsEFF = c(2.6761, 2.6852, .2, 3.1304, 3.1165, 1)
HypervarsEFF=HypervarsEFF^2
##Trial Parameters
##Cohort Size, N^F and N_ET
cohort=3
##Starting Dose
DoseStart=1
##Vector of Numerical Doses
Dose = c(1,2,3,3.5,5)
##Dose for Eff-Tox
Dose=log(Dose)-mean(log(Dose))
Nmax=30 ##Max Sample Size
#Acceptability Criterion
CutE=.3
CutT=.4
##Limits on acceptability
AcceptE=.1
AcceptT=.1
##UTILITY Matrix
UT = matrix(c(38.23529,100,0,61.76471),nrow=2,byrow=TRUE)
RESULTS=SimEfftoxUt(NSims, Dose,PE,  PT, corET,
Nmax, cohort, UT, CutE, CutT, AcceptE,AcceptT,  HypermeansEFF, HypervarsEFF)
RESULTS
}
