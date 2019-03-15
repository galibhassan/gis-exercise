
# We have to calculate Refractance for s- and p-polarized lights
# Formulae are derived from: https://en.wikipedia.org/wiki/Fresnel_equations

# Let's first write a function which will take
# E_r, aoi, aot as input; 
# and returns
# The reflectance for s-polarized light (R_s) as output
# (V-polarization corresponds to R_s)
getRs = function(E_r, aoi, aot){
  R_s = abs(
            (cos(aoi) -  sqrt(E_r) * cos(aot)  ) /
            (cos(aoi) +  sqrt(E_r) * cos(aot)  )
        )^2
  
  return(R_s)
}

# Similarly, write a function which will take
# E_r, aoi, aot as input; 
# and returns
# The reflectance for p-polarized light (R_p) as output 
# (H-polarization corresponds to R_p)
getRp = function(E_r, aoi, aot){
  R_p = abs(
          (cos(aot) -  sqrt(E_r) * cos(aoi)  ) /
          (cos(aot) +  sqrt(E_r) * cos(aoi)  )
        )^2

  return(R_p)
}


# To get transmission angles (aot's) from incidend angles (aoi's), we already have
# written a formula in the "problemA.R" file. Let's use the source command to make that
# functionality available. 
source('C:/work/learning/gettingSmarter/personal/tanz-rem-sens-hw/problemA.R')

# Now is the time to use it!

# make an array of incident angles from 0 to 80 degree
theta1_degree = seq(from=0, to=80, by=.1)

# E_r = 3
R_s_3 = getRs(
  3, 
  theta1_degree, 
  getTransmissionAngle(3, theta1_degree)
)

R_p_3 = getRp(
  3, 
  theta1_degree, 
  getTransmissionAngle(3, theta1_degree)
)

plot(x = theta1_degree, y = R_s_3, col='darkblue')
points(x = theta1_degree, y = R_p_3, col='red')




