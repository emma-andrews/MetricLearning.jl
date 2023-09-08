abstract type Miner end

"""
    AngularMiner(angle::Int64, distance::Distance)

Create an Angular Miner with the provided angle value and [`Distance`](@ref) metric.
"""
struct AngularMiner <: Miner
    angle::Int64
    distance::Distance
end

"""
    BatchStrategies

Enum for possible batch strategies for [`BatchEasyHardMiner`](@ref). Supported strategies:
    - easy
    - semihard
    - hard
    - all
"""
@enum BatchStrategies begin
    easy
    semihard
    hard
    all
end

"""
    BatchEasyHardMiner(positive_strategy, negative_strategy, positive_range, negative_range, distance::Distance)

Create a Batch Easy Hard Miner with the provided strategies and [`Distance`](@ref) metric.
"""
struct BatchEasyHardMiner <: Miner
    positive_strategy::BatchStrategies
    negative_strategy::BatchStrategies
    positive_range
    negative_range
    distance::Distance
end

"""
    DistanceWeightedMiner(margin::Float64, distance::Distance)

Create a Distance Weighted Miner with the provided [`Distance`](@ref) metric.
"""
struct DistanceWeightedMiner <: Miner
    distance::Distance
end

"""
    MultiSimilarityMiner(margin::Float64, distance::Distance)

Create a Multi Similarity Miner with the provided margin value and [`Distance`](@ref) metric.
"""
struct MultiSimilarityMiner <: Miner
    margin::Float64
    distance::Distance
end

"""
    PairMarginMiner(positive_margin::Float64, negative_margin::Float64, distance::Distance)

Create a Pair Margin Miner with the provided margins and [`Distance`](@ref) metric.
"""
struct PairMarginMiner <: Miner
    positive_margin::Float64
    negative_margin::Float64
    distance::Distance
end

"""
    TripletTypes

Enum for possible triplet types for [`TripletMarginMiner`](@ref). Supported strategies:
    - easy
    - semihard
    - hard
    - all
"""
@enum TripletTypes begin
    easy
    semihard
    hard
    all
end

"""
    TripletMarginMiner(margin::Float64, triplet_type::TripletTypes, distance::Distance)

Create a Triplet Margin Miner with the provided margins and [`Distance`](@ref) metric.
"""
struct TripletMarginMiner <: Miner
    margin::Float64
    triplet_type::TripletTypes
    distance::Distance
end