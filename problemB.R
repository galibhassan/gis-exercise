
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
# written a formula in the "problemA.R" file. But this time, we want to return the value
# of the aot's in radian. So, let's modify it.

getTransmissionAngle = function(E_r, inAngleD){
  inAngleR = (pi/180)*inAngleD
  transAngleR = asin(sin(inAngleR)/sqrt(E_r)) 
  transAngleD = (180/pi)*transAngleR
  return(transAngleR)
}


# make an array of incident angles from 0 to 80 degree
theta1_degree = seq(from=0, to=80, by=.1)
theta1_radian = theta1_degree*pi/180

# E_r = 3 --------------------------------------
R_s_3 = getRs(
  3, 
  theta1_radian, 
  getTransmissionAngle(3, theta1_radian)
)

R_p_3 = getRp(
  3, 
  theta1_radian, 
  getTransmissionAngle(3, theta1_radian)
)

plot(x = theta1_degree, y = R_s_3, col='darkblue', ylim = c(-.1,1), ylab = 'R_s and R_p', xlab = 'angle of incidence')
points(x = theta1_degree, y = R_p_3, col='red')

# E_r = 10 --------------------------------------
R_s_10 = getRs(
  10, 
  theta1_radian,
  getTransmissionAngle(10, theta1_radian)
)

R_p_10 = getRp(
  10,
  theta1_radian,
  getTransmissionAngle(10, theta1_radian)
)

points(x = theta1_degree, y = R_s_10, col='green')
points(x = theta1_degree, y = R_p_10, col='blue')

# E_r = 50 --------------------------------------

R_s_50 = getRs(
  50, 
  theta1_radian,
  getTransmissionAngle(50, theta1_radian)
)

R_p_50 = getRp(
  50,
  theta1_radian,
  getTransmissionAngle(50, theta1_radian)
)

points(x = theta1_degree, y = R_s_50, col='orange')
points(x = theta1_degree, y = R_p_50, col='magenta')



