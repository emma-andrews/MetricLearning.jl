using LinearAlgebra

@doc raw"""
    angular_loss(embeddings, labels; α = 0.5)

Calculates the angular loss for given embeddings and labels. This loss is defined as
    ```math
    \mathcal{L} = \frac{1}{N} \sum_{x_a \in \mathcal{B}} \{ \}
    ```
"""
function angular_loss(embeddings, labels; α = 0.5)
    anchors, positives = get_pairs(embeddings, labels)
    tan_sq = tan(α) ^ 2
    anc_pos_dot = dot(anchors, positives)
end