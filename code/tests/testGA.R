# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

source("../evolutivesAux.R")
source("../geneticAlgorithm.R")
set.seed(42)

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

mat.dist = make.distances(dmin = 0, dmax = 1000, ncities = 5)
print(mat.dist)

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

# test01
obj = geneticAlgorithm(dist.matrix = mat.dist, selection = "roulette",
  ncities = nrow(mat.dist), pop.size = 100, ngenerations = 5000,
  mutation.prob = 0.02, elitism = 0.1, k = 2)

# plot(x = 1:length(obj$avgFitness), y = obj$avgFitness)
df = data.frame(x = 1:length(obj$avgFitness), y = obj$avgFitness)
library(ggplot2)
g = ggplot(df, mapping = aes(x = x, y = y)) + geom_line()
g

best.fitness = max((obj$population[,6]))
ids = which(obj$population[,6] == best.fitness)
obj$population[ids,]

#solucoes unicas
unique(obj$population[ids, ])

# total de solucoes
nrow(unique(obj$population[ids,]))

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
