################ Funnctions to perfomr SDMs and calculate species level thermal affinity matrices 
#########
###Major input: GetCoords + GetEnv
# Coords - data frame of z/ y (long / lat). Output of GetCoords  
# Env - stacked enviromental layer. Output of GetEnv 


########## Define pseudoabsences, uses the the novel three-step method as described in Iturbide et al. (2015) 
 
GetPseudo <- function(Coords, Env, N, prev) {
  library(mopa) 
  bg.profile <- OCSVMprofiling(xy = Coords, varstack = Env)
  bagr.radius <- backgroundRadius(xy = Coords, background = bg.profile$absence,  unit = "decimal degrees") 
  pseudo_TS <- pseudoAbsences(xy = Coords, realizations=N, background = bagr.radius, exclusion.buffer = 0.0166, prevalence = prev)
  return(pseudo_TS) 
  }

#preform SDM
# Note that this SDM does not perform cross-validation 


SDM <- function(Coords, Env, Pseudo, real) {
  library(dismo)
  return(maxent(p=Coords, x=Env, a=Pseudo[[real]]))
} 


#Extract affinity 
#temp = enviromental variable to extract, usualy temperature
# The output is corrently a vector of the Quantiles=c(0.1,0.25,0.50,0.75,0.9)as well as optimal values for the selcte enviroemntal predictor 
SDMaff<-function(SDM,temp){
  
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
  
  Values=cbind.data.frame(c("Topt","Tq10","Tq25","Tq50","Tq75","Tq90"),c(Topt,Tq10,Tq25,Tq50,Tq75,Tq90))
  
  return(Values)
}  


#### the  actual code to run!!!!
N=5 ##N - number of pseudoAbsences realizations  
prev = 0.5 #ratio of presences to pseudoAbsences
Affinity=matrix(NA, nrow=N , ncol=6) 
colnames(Affinity)=c("Topt","Tq10","Tq25","Tq50","Tq75","Tq90")

#temp = enviromental variable to extract, usualy temperature

for (real in 1:N ) {  # loop to go over differnt pseudoAbsences realizations  
  
  pseudo_TS<- GetPseudo(Coords, Env, N, prev)
  SDM_output <- SDM(Coords, Env, Pseudo, real) 
  Affinity[real, ]<-SDMaff(SDM,temp) 
  
} # end of loop to go over differnt pseudoAbsences realizations

FinalAffinity= colMeans(Affinity) # the final climatic affintiy estimates 
  
  
  





