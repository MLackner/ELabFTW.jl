using ELabFTW
using Documenter

DocMeta.setdocmeta!(ELabFTW, :DocTestSetup, :(using ELabFTW); recursive=true)

makedocs(;
    modules=[ELabFTW],
    authors="= <=> and contributors",
    repo="https://github.com/MLackner/ELabFTW.jl/blob/{commit}{path}#{line}",
    sitename="ELabFTW.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://MLackner.github.io/ELabFTW.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/MLackner/ELabFTW.jl",
    devbranch="main",
)
