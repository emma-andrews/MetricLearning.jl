module MetricLearning

using Parameters
using Flux

include("Distances.jl")
include("Losses.jl")

export Distance
export CosineSimilarity
export DotProductSimilarity
export EuclideanDistance
export LpDistance
export SNRDistance


end # module MetricLearning
