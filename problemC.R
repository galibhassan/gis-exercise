
# angle of incidence
aoi_d = seq(from=0, to=80, by=1)

# Creating a function which will take Er and angle of incidence as input
# and return tp, rs and ts in a dataframe
getValues = function(er, theta1D){
  # degree-radian conversions
  theta1R = (pi/180)*theta1D
  theta2R = asin((sin(theta1R))/(sqrt(er)))
  theta2D = (180/pi)*theta2R
  
  # calculating tp, rs and ts
  tp = 
    (2*sin(theta1R)*cos(theta1R)) / 
    ((er*cos(theta1R)*sin(theta2R))) +(cos(theta2R)*sin(theta1R))
  
  rs =  (
          (cos(theta1R)-((sqrt(er))*(cos(theta2R)))) /
          (cos(theta1R)+((sqrt(er))*(cos(theta2R))))
        )
  ts = 1 + rs
  
  # returning
  output = data.frame(
    "tp" = tp,
    "rs" = rs,
    "ts" = ts
  )
  return(output)
}

# calculating values
valuesForEr03 = getValues(3, aoi_d)
valuesForEr10 = getValues(10, aoi_d)
valuesForEr50 = getValues(50, aoi_d)


# plotting
plot(x = aoi_d, y = valuesForEr03$tp, col='darkblue', ylim = c(-.1,2), ylab = 'tp and ts', xlab = 'Angle of incidence')
points(x = aoi_d, y = valuesForEr03$ts, col='red')

points(x = aoi_d, y = valuesForEr10$tp, col='orange')
points(x = aoi_d, y = valuesForEr10$ts, col='green')

points(x = aoi_d, y = valuesForEr50$tp, col='magenta')
points(x = aoi_d, y = valuesForEr50$ts, col='blue')

legend(
  1,2, 
  legend = c("Rs3", "Rp3","Rs10", "Rp10","Rs50", "Rp50"),
  col = c('darkblue', 'red', 'green', 'blue', 'orange', 'magenta'),
  lty=1:1, cex=0.8
)

