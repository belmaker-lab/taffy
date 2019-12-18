################ Funnctions to perfomr SDMs and calculate species level thermal affinity matrices 
#########
###Major input: GetCoords + GetEnv
# Coords - data frame of z/ y (long / lat). Output of GetCoords  
# Env - stacked enviromental layer. Output of GetEnv 


########## Define pseudoabsences, uses the the novel three-step method as described in Iturbide et al. (2015) 
N=10 ##N - number of pseudoAbsences realizations  
prev = 0.5 #ratio of presences to pseudoAbsences

GetPseudo <- function(Coords, Env, N, prev) {
  library(mopa)
  
  bg.profile <- OCSVMprofiling(xy = Coords, varstack = Env)
  bagr.radius <- backgroundRadius(xy = Coords, background = bg.profile$absence,  unit = "decimal degrees") 
  pseudo_TS <- pseudoAbsences(xy = GetCoords, realizations=N, background = bagr.radius, exclusion.buffer = 0.01, prevalence = 0.5)
  return(pseudo_TS) 
  
}

#preform SDM

SDM <- function(GetCoords, GetEnv, GetPseudo) {
  
  
} 

#Extract affinity 

response(bc)

  SDMaff<-{
    
    
    return(temp_C)  
    
  }
  
  




