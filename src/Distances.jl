using Statistics
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

Equivalent to [`DotProductSimilarity(normalize=true)`](@ref)
"""
struct CosineSimilarity <: Distance
end

@doc raw"""
    compute_dist_matrix(distance::CosineSimilarity, query_embeds, ref_embeds)

Calculate Cosine Similarity distance between ``query\_embeds`` and ``ref\_embeds``:
```math
d = \frac{query\_embeds \cdot ref\_embeds}{||query\_embeds||\,||ref\_embeds||}
```
"""
function compute_dist_matrix(distance::CosineSimilarity, query_embeds, ref_embeds)
    compute_dist_matrix(DotProductSimilarity(true), query_embeds, ref_embeds)
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

@doc raw"""
    compute_dist_matrix(distance::DotProductSimilarity, query_embeds, ref_embeds)

Calculate Dot Product Similarity distance between ``query\_embeds`` and ``ref\_embeds``:
```math
d = query\_embeds \cdot ref\_embeds
```

If normalize is true:
```math
d = \frac{query\_embeds \cdot ref\_embeds}{||query\_embeds||\,||ref\_embeds||}
```
"""
function compute_dist_matrix(distance::DotProductSimilarity, query_embeds, ref_embeds)
    num_rows = size(query_embeds, 1)
    result = zeros(num_rows, num_rows)

    for i in 1..num_rows
        for j in 1..num_rows
            result[i, j] = dot(query_embeds[i], ref_embeds[j])
            if distance.normalize
                result[i, j] = result[i, j] / (norm(query_embeds[i]) * norm(ref_embeds[j]))
            end
        end
    end
    return result
end

"""
    EuclideanDistance

Calculate Euclidean distance between ``x`` and ``y``.
"""
struct EuclideanDistance <: Distance
end

@doc raw"""
    compute_dist_matrix(distance::EuclideanDistance, query_embeds, ref_embeds)

Calculate Euclidean distance between ``query\_embeds`` and ``ref\_embeds``:
"""
function compute_dist_matrix(distance::EuclideanDistance, query_embeds, ref_embeds)
    return compute_dist_matrix(LpDistance(2), query_embeds, ref_embeds)
end

"""
    LpDistance

Calculate Lp distance between ``x`` and ``y``.
"""
@with_kw struct LpDistance <: Distance
    p::Int64 = 2
end

@doc raw"""
    compute_dist_matrix(distance::LpDistance, query_embeds, ref_embeds)

Calculate Lp distance between ``query\_embeds`` and ``ref\_embeds``:
```math
d = ||query\_embeds \cdot ref\_embeds||_p
```
"""
function compute_dist_matrix(distance::LpDistance, query_embeds, ref_embeds)
    num_rows = size(query_embeds, 1)

    result = zeros(num_rows, num_rows)
    for i in 1..num_rows
        for j in 1..num_rows
            result[i, j] = norm(query_embeds[i] - ref_embeds[j], distance.p)
        end
    end
    return result
end

"""
    SNRDistance

Calculate Signal-to-Noise Ratio distance between ``x`` and ``y``.
"""
struct SNRDistance <: Distance
end

@doc raw"""
    compute_dist_matrix(distance::SNRDistance, query_embeds, ref_embeds)

Calculate SNR distance between ``query\_embeds`` and ``ref\_embeds``:
"""
function compute_dist_matrix(distance::SNRDistance, query_embeds, ref_embeds)
    num_rows = size(query_embeds, 1)

    result = zeros(num_rows, num_rows)
    for i in 1..num_rows
        for j in 1..num_rows
            result[i, j] = var(query_embeds[i] - ref_embeds[j]) / var(query_embeds[i])
        end
    end
    return result
end