# -----------------------------------------------------------------
# -----------------------------------------------------------------

# lrn.rate(eta): η > 0, typically 0 < η << 0.1
# phi(v) = v

adalineSGD.train = function(dataset, lrn.rate = 0.0001,
  n.iter = 100) {

  # for each epoch
      # for each example from X
          # compute spike (v)
          # expected output (v)

          # measure the cost
          # cost = sum(Y - V)^2

          # update weights
          # w = w + eta * (Y - V) * X
}

# -----------------------------------------------------------------
# -----------------------------------------------------------------

# after training
# phi(v) = +1, v >= 0
# phi(v) = -1, v <0

adalineSGD.predict = function(example, weights) {

  z = as.numeric(example %*% weights)
  y = ifelse(z >= 0, +1, -1)

  # for regression, modify to return just z
  return(y)
}

# -----------------------------------------------------------------
# -----------------------------------------------------------------
