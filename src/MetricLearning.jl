module MetricLearning

using Parameters
using Flux

include("Distances.jl")
include("Miners.jl")
include("Losses.jl")

export Distance
export CosineSimilarity
export DotProductSimilarity
export EuclideanDistance
export LpDistance
export SNRDistance

export Miners
export AngularMiner
export BatchStrategies, BatchEasyHardMiner
export DistanceWeightedMiner
export MultiSimilarityMiner
export PairMarginMiner
export TripletMarginMiner, TripletTypes

end # module MetricLearning
