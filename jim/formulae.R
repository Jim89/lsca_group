= (((MAX(($G3-Demand!G$3),0))/($G3-Demand!G$3)) * (($B3*Demand!G$3)+($D3*(MAX(($G3-Demand!G$3),0)))-($C3*$G3))) + 
  (((MAX((($G3+(600*($C3-$D3)/($B3-$D3)))-Demand!G$3),0))/(($G3+(600*($C3-$D3)/($B3-$D3)))-Demand!G$3)) * (($B3*$G3)+(0)-($C3*$G3))) + 
  (((MAX((($G3+600)-Demand!G$3),0))/(($G3+600)-Demand!G$3)) * (($B3*Demand!G$3)+($D3*(MAX((($G3+600)-Demand!G$3),0)))-($C3*($G3+600)))) + 
  ((1 - ((MAX((($G3+600)-Demand!G$3),0))/(($G3+600)-Demand!G$3))) * (($B3 * Demand!G$3) + (0) - ($C3 * Demand!G$3)))

I1 <- ((MAX(($G3-Demand!G$3),0))/($G3-Demand!G$3))
I2 <- ((MAX((($G3+(600*($C3-$D3)/($B3-$D3)))-Demand!G$3),0))/(($G3+(600*($C3-$D3)/($B3-$D3)))-Demand!G$3))
I3 <- ((MAX((($G3+600)-Demand!G$3),0))/(($G3+600)-Demand!G$3))
I4 <- (1 - ((MAX((($G3+600)-Demand!G$3),0))/(($G3+600)-Demand!G$3)))

I2 - I1 <- (((MAX((($G3+(600*($C3-$D3)/($B3-$D3)))-Demand!G$3),0))/(($G3+(600*($C3-$D3)/($B3-$D3)))-Demand!G$3)) - ((MAX(($G3-Demand!G$3),0))/($G3-Demand!G$3)))
I3 - I2 <- ((MAX((($G3+600)-Demand!G$3),0))/(($G3+600)-Demand!G$3)) - ((MAX((($G3+(600*($C3-$D3)/($B3-$D3)))-Demand!G$3),0))/(($G3+(600*($C3-$D3)/($B3-$D3)))-Demand!G$3))


# First section: I1 * profit fn
(((MAX(($G3-Demand!G$3),0))/($G3-Demand!G$3)) * (($B3*Demand!G$3)+($D3*(MAX(($G3-Demand!G$3),0)))-($C3*$G3)))

# Second section: I2-I1 * profit fn
((((MAX((($G3+(600*($C3-$D3)/($B3-$D3)))-Demand!G$3),0))/(($G3+(600*($C3-$D3)/($B3-$D3)))-Demand!G$3)) - ((MAX(($G3-Demand!G$3),0))/($G3-Demand!G$3))) * (($B3*$G3)+(0)-($C3*$G3)))

# Third section: I3 - I2 * profit fn
((((MAX((($G3+600)-Demand!G$3),0))/(($G3+600)-Demand!G$3)) - ((MAX((($G3+(600*($C3-$D3)/($B3-$D3)))-Demand!G$3),0))/(($G3+(600*($C3-$D3)/($B3-$D3)))-Demand!G$3))) * (($B3*Demand!G$3)+($D3*(MAX((($G3+600)-Demand!G$3),0)))-($C3*($G3+600))))

# Fourth section: 1- I3 * profit fn
((1 - ((MAX((($G3+600)-Demand!G$3),0))/(($G3+600)-Demand!G$3))) * (($B3 * Demand!G$3) + (0) - ($C3 * Demand!G$3)))

# Overall
((((MAX(($G3-Demand!G3),0))/($G3-Demand!G3)) * (($B3*Demand!G3)+($D3*(MAX(($G3-Demand!G3),0)))-($C3*$G3))) +
((((MAX((($G3+($E3*($C3-$D3)/($B3-$D3)))-Demand!G3),0))/(($G3+($E3*($C3-$D3)/($B3-$D3)))-Demand!G3)) - ((MAX(($G3-Demand!G3),0))/($G3-Demand!G3))) * (($B3*$G3)+(0)-($C3*$G3))) +
((((MAX((($G3+$E3)-Demand!G3),0))/(($G3+$E3)-Demand!G3)) - ((MAX((($G3+($E3*($C3-$D3)/($B3-$D3)))-Demand!G3),0))/(($G3+($E3*($C3-$D3)/($B3-$D3)))-Demand!G3))) * (($B3*Demand!G3)+($D3*(MAX((($G3+$E3)-Demand!G3),0)))-($C3*($G3+$E3)))) + 
((1 - ((MAX((($G3+$E3)-Demand!G3),0))/(($G3+$E3)-Demand!G3))) * (($B3 * Demand!G3) + (0) - ($C3 * Demand!G3))))
