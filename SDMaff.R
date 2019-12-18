<<<<<<< HEAD
################ Funnctions to perfomr SDMs and calculate species level thermal affinity matrices 
#########
###Major input: GetCoords + GetEnv
# Coords - data frame of z/ y (long / lat). Output of GetCoords  
# Env - stacked enviromental layer. Output of GetEnv 
=======
### Funnctions to perfomr SDMS and calculate species level thermal affinity matrices 
>>>>>>> 2532cc60b57ba0fea240a4dc19ec0a0d644a70e7


<<<<<<< HEAD
########## Define pseudoabsences, uses the the novel three-step method as described in Iturbide et al. (2015) 
N=10 ##N - number of pseudoAbsences realizations  
prev = 0.5 #ratio of presences to pseudoAbsences
=======
>>>>>>> 2532cc60b57ba0fea240a4dc19ec0a0d644a70e7

# Define pseudoabsences 


GetPseudo <- function(GetCoords, GetEnv) {
  library(mopa)
  
  
}

#preform SDM

<<<<<<< HEAD
=======


>>>>>>> 2532cc60b57ba0fea240a4dc19ec0a0d644a70e7
SDM <- function(GetCoords, GetEnv, GetPseudo) {
  library(dismo)
  return(maxent(p=GetCoords, x=GetEnv, a=GetPseudo))
} 


#Extract affinity 

response(bc)

  SDMaff<-{
    
    
    return(temp_C)  
    
  }
  
  
<<<<<<< HEAD
=======
  
  temp_C <- (temp_F - 32) * 5 / 9
  return(temp_C)
  
  return(temp_C) 
  
}



SDMaff <- function(GetCoords, GetEnv) {
  
  
  
  
  temp_C <- (temp_F - 32) * 5 / 9
  return(temp_C)
  
  return(temp_C) 
  
}
>>>>>>> 2532cc60b57ba0fea240a4dc19ec0a0d644a70e7




