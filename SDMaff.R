### Funnctions to perfomr SDMs and calculate species level thermal affinity matrices 

input: GetCoords + GetEnv

# Define pseudoabsences, uses the the novel three-step method as described in Iturbide et al. (2015) 
N=10 ##N - number of pseudoAbsences realizations  
prev = 0.5 #ratio of presences to pseudoAbsences
# Coords - data frame of z/ y (long / lat) 

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



  SDMaff<-{
    
    
    return(temp_C)  
    
  }
  
  
  
  temp_C <- (temp_F - 32) * 5 / 9
  return(temp_C)
  
  return(temp_C) 
  
}



SDMaff <- function(GetCoords, GetEnv) {
  

  
  return(temp_C) 
  
}




