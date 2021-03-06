# -----------------------------------------------------------------
# -----------------------------------------------------------------

source("mlp.R")

library("setwidth")
library("ggplot2")
library("OpenML")

seed.value = 24
set.seed(seed.value)

# -----------------------------------------------------------------
# -----------------------------------------------------------------

# get iris dataset
dataset = OpenML::getOMLDataSet(data.id = 61)
data    = dataset$data

# -----------------------------------------------------------------
# -----------------------------------------------------------------

#split class into 3 target variables
data$class.Setosa     = 0
data$class.Versicolor = 0
data$class.Virginica  = 0

data$class.Setosa[which(data$class == "Iris-setosa")] = 1
data$class.Versicolor[which(data$class == "Iris-versicolor")] = 1
data$class.Virginica[which(data$class == "Iris-virginica")] = 1

data$class = NULL

# -----------------------------------------------------------------
# -----------------------------------------------------------------

# split into data and test
train.data = data[c( 1:30,  51:80, 101:130), ]
test.data  = data[c(31:50, 81:100, 131:150), ]

# -----------------------------------------------------------------
# -----------------------------------------------------------------

#  activation function
fnet = function(x) {
  y = 1 /(1 + exp(-x))
  return(y)
}

# derivative function
dfnet = function(x) {
  y = x * (1-x)
  return(y)
}

# -----------------------------------------------------------------
# -----------------------------------------------------------------

model = mlp.create(input.length = 4, hidden.length = 3,
  output.length = 3, fnet = fnet, dfnet = dfnet)

obj = mlp.train(model = model, dataset = train.data, lrn.rate = 0.1,
    threshold = 1e-2, n.iter = 10000)

# test each example from testing set
aux = lapply(1:nrow(test.data), function(i) {
  pred = mlp.test(model = obj$model, example = test.data[i, 1:model$input.length])
  ret = as.numeric(round(pred$fnet.output))
  return(ret)cd
})

# real class values
y.real = test.data[, 5:7]

# getting predictions
y.pred = data.frame(do.call("rbind", aux))
colnames(y.pred) = colnames(y.real)

# checking predictions x expected classes
acc = 0
for(i in 1:nrow(test.data)){
  if( which.max(y.pred[i,]) == which.max(y.real[i,])) {
    acc = acc + 1
  }
}

res = acc/nrow(test.data)
print(res)

# -----------------------------------------------------------------
# -----------------------------------------------------------------
