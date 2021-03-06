% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/GetPriorsSPSO.R
\name{GetPriorsSPSO}
\alias{GetPriorsSPSO}
\title{Returns prior dose-specific means and prior ESS for the SPSO model.}
\usage{
GetPriorsSPSO(PROBST, PROBSE, tau, Var, HypVar, PGLOBAL)
}
\arguments{
\item{PROBST}{Elicited prior toxicity probability at each dose.}

\item{PROBSE}{Elicted prior efficacy probability at each dose.}

\item{tau}{Frailty variance parameter.}

\item{Var}{Latent parameter variance for normal probability of efficacy and toxicity.}

\item{HypVar}{Hypervariance on dose specific mean efficacy and toxicity parameters.}

\item{PGLOBAL}{Global monotonicity probability of dose-efficacy curve.}
}
\value{
A list contianing (1) the prior effective sample size, (2) the vector of dose-specific efficacy probability prior mean parameters and, (3) the vector of dose-specific toxicity probability prior mean parameters.
}
\description{
Uses elicited efficacy and toxicity dose-specific parameters along withlatent prior variance, dose-specific mean hypervariance, frailty variance, and global probability of monotonicity to determine dose-specific prior means for efficacy and toxicityand prints the prior effective sample size associated with the specified prior parameters.
}
\examples{
library(mvtnorm)
##Elicited probabilities of toxicity
PROBST=c(.05,.10,.15,.20,.30)
##Elicited probabilities of efficacy
PROBSE=c(.2,.4,.6,.65,.7)
##Sigma_0
Var=1
##Sigma_mu
HypVar=16
##Frailty Variance
tau=1
##Global Monotonicity Probability
PGLOBAL=.1
Z=GetPriorsSPSO(PROBST,PROBSE,tau,Var,HypVar,PGLOBAL)
Z
}
