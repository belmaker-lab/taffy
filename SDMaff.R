################ Funnctions to perfomr SDMs and calculate species level thermal affinity matrices 
#########
###Major input: GetCoords + GetEnv
# Coords - data frame of z/ y (long / lat). Output of GetCoords  
# Env - stacked enviromental layer. Output of GetEnv 


########## Define pseudoabsences, uses the the novel three-step method as described in Iturbide et al. (2015) 
N=10 ##N - number of pseudoAbsences realizations  
prev = 0.5 #ratio of presences to pseudoAbsences
library(mopa)

# Define pseudoabsences 
GetPseudo <- function(Coords, Env, N, prev) {
  bg.profile <- OCSVMprofiling(xy = Coords, varstack = Env)
  bagr.radius <- backgroundRadius(xy = Coords, background = bg.profile$absence,  unit = "decimal degrees") 
  pseudo_TS <- pseudoAbsences(xy = GetCoords, realizations=N, background = bagr.radius, exclusion.buffer = 0.01, prevalence = 0.5)
  return(pseudo_TS) 
  
}

#preform SDM
# Note that this SDM does not perform cross-validation 

SDM <- function(Coords, Env, Pseudo) {
  library(dismo)
  return(maxent(p=Coords, x=Env, a=Pseudo))
} 

#Extract affinity 
#temp = enviromental variable to extract, usualy temperature
SDMaff<-function(SDM(),temp){
  
  a = as.data.frame(response(SDM,var = temp))
  a$prob=a$p/sum(a$p)
  a$cum = cumsum(a$prob)
  Quant=c(0.1,0.25,0.50,0.75,0.9)
  Locations=sapply(Quant, function(y)which.min(abs(a[,4]-y)))
  Topt = a[which.min(abs(max(a$p)-a$p)),1]
  Tq10 =a[Locations[1],1]
  Tq25 =a[Locations[2],1]
  Tq50 =a[Locations[3],1]
  Tq75 = a[Locations[4],1]
  Tq90 = a[Locations[5],1]
  return(temp_C)
}  


  
  
  
  
  





