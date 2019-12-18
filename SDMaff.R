### Funnctions to perfomr SDMS and calculate species level thermal affinity matrices 

input: GetCoords + GetEnv


# Define pseudoabsences 


GetPseudo <- function(GetCoords, GetEnv) {
  library(mopa)
  
  
}

#preform SDM



SDM <- function(GetCoords, GetEnv, GetPseudo) {
  library(dismo)
  return(maxent(p=GetCoords, x=GetEnv, a=GetPseudo))
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
  
  
  
  
  temp_C <- (temp_F - 32) * 5 / 9
  return(temp_C)
  
  return(temp_C) 
  
}




