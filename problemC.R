er = c(3, 10,50)

plot(0,0)

for (i in 1:3) {
  theta1D = seq(from=0, to=80, by=1)
  theta1R = (pi/180)*theta1D
  theta2R = asin((sin(theta1R))/(sqrt(er[i])))
  theta2D = (180/pi)*theta2R
  tp = (2*sin(theta1R)*cos(theta1R))/((er[i]*cos(theta1R)*sin(theta2R)))+(cos(theta2R)*sin(theta1R))
  rs = ((cos(theta1R)-((sqrt(er[i]))*(cos(theta2R))))/(cos(theta1R)+((sqrt(er[i]))*(cos(theta2R)))))
  ts = 1 + rs;
  points(theta1D, tp)
  points(theta1D, ts)
}

#for i = 1:1:3
# plot(theta1D,tp,'o',theta1D,ts,'*')
# hold on
# clear theta1D theta1PI theta2PI theta2D
# end
