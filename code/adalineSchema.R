# -----------------------------------------------------------------
# -----------------------------------------------------------------

# lrn.rate: η > 0, typically 0 < η << 0.1
# phi(v) = v


adalineSGD.train = function(dataset, lrn.rate = 0.0001,
  n.iter = 100) {

  # batch learning (compute activation for all the dataset)
    # compute spike
    # expected output

  # measure the cost

  # update weights
  # w = w + eta * Xt * (Y - X * w)

}

# -----------------------------------------------------------------
# -----------------------------------------------------------------

# after training
# phi(v) = +1, v >= 0
# phi(v) = -1, v <0

adalineSGD.predict = function(example, weights) {

  z = as.numeric(example %*% weights)
  y = ifelse(z >= 0, +1, -1)
  return(y)
}

# -----------------------------------------------------------------
# -----------------------------------------------------------------
