# Clean workspace
rm(list=ls())


# We have to calculate Refractance for s- and p-polarized lights
# Formulae are given here: https://en.wikipedia.org/wiki/Fresnel_equations

# Let's first write a function which will take
# Z1, Z2, aoi, aot as input; 
# and returns
# The reflectance for s-polarized light (R_s) as output 
getRs = function(Z1, Z2, aoi, aot){
  R_s = (
          abs(
              (Z2*cos(aoi) - Z1*cos(aot)) / 
              (Z2*cos(aoi) + Z1*cos(aot))
          )
        )^2
  
  return(R_s)
}

# Similarly, write a function which will take
# Z1, Z2, aoi, aot as input; 
# and returns
# The reflectance for p-polarized light (R_p) as output 
getRp = function(Z1, Z2, aoi, aot){
  R_p = (
    abs(
      (Z2*cos(aot) - Z1*cos(aoi)) / 
      (Z2*cos(aot) + Z1*cos(aoi))
    )
  )^2

  return(R_p)
}





