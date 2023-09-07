###########################################################
#
# Abstract Distance type
#
###########################################################
"""
    Distance

Abstract type for all distance metrics.
"""
abstract type Distance end

###########################################################
#
# Distance types
#
###########################################################
"""
    CosineSimilarity

Calculate Cosine Similarity distance between ``x`` and ``y``.
"""
struct CosineSimilarity <: Distance
end

"""
    DotProductSimilarity(normalize::Bool)

Calculate Dot Product Similarity distance between ``x`` and ``y``.

If normalize = true, it is equivalent to [`CosineSimilarity`](@ref)
"""
@with_kw struct DotProductSimilarity <: Distance
    # normalize = true is equivalent to CosineSimilarity
    normalize::Bool = false
end

"""
    EuclideanDistance

Calculate Euclidean distance between ``x`` and ``y``.
"""
struct EuclideanDistance <: Distance
end

"""
    LpDistance

Calculate Lp distance between ``x`` and ``y``.
"""
struct LpDistance <: Distance
end

"""
    SNRDistance

Calculate Signal-to-Noise Ratio distance between ``x`` and ``y``.
"""
struct SNRDistance <: Distance
end