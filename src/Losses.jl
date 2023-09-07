###########################################################
#
# Abstract Metric Learning Loss type
#
###########################################################
abstract type MLLoss end

struct AngularLoss <: MLLoss
end

struct ArcFaceLoss <: MLLoss
end

struct CircleLoss <: MLLoss
end

struct ContrastiveLoss <: MLLoss
end

