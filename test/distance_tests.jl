@testset "Distances" begin
    @testset "Cosine Similarity" begin
        dist = CosineSimilarity()
        @test typeof(dist) != Nothing
    end

    @testset "Dot Product Similarity" begin
        dist = DotProductSimilarity(false)
        @test typeof(dist) != Nothing
    end

    @testset "Euclidean" begin
        dist = EuclideanDistance()
        @test typeof(dist) != Nothing
    end

    @testset "Lp" begin
        dist = LpDistance(1)
        @test typeof(dist) != Nothing
    end

    @testset "SNR" begin
        dist = SNRDistance()
        @test typeof(dist) != Nothing
    end
end