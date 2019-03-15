# Let's first write a function which will take
# relative permitivity (E_r) and the angle of incidence (in degree) as input;
# and returns the angle of transmission (in degree)
#
# following the syntax:
# myFunctionName = function(argument1, argument2, ... ){
#   body of the function
#   return(the thing to be returned)
# }
getTransmissionAngle = function(E_r, inAngleD){
  inAngleR = (pi/180)*inAngleD
  transAngleR = asin(sin(inAngleR)/sqrt(E_r)) 
  transAngleD = (180/pi)*transAngleR
  return(transAngleD)
}

# make an array of incident angles from 0 to 80 degree
theta1_degree = seq(from=0, to=80, by=.1)

# Let's plot now for different permittivity (E_r) values.
# For the first plot, use plot(x,y) command.
# For the next ones use points(x,y) command, so that, they all appear in the 
# same set of axes. 

# E_r = 3
plot(
  x = theta1_degree,
  y = getTransmissionAngle(3, theta1_degree), 
  col="chocolate"
)


# E_r = 10
points(
  x = theta1_degree,
  y = getTransmissionAngle(10, theta1_degree), 
  col="seagreen"
)


# E_r = 50
points(
  x = theta1_degree,
  y = getTransmissionAngle(50, theta1_degree), 
  col="cornflowerblue"
)

