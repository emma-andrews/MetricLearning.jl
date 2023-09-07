using Documenter, MetricLearning

makedocs(sitename="MetricLearning",
        format=Documenter.HTML(prettyurls=false))

deploydocs(
        repo = "github.com/emma-andrews/MetricLearning.jl.git",
)