using ELabFTW
using Test

# @testset "GET request" begin
#     api = ELabFTW.BASE_API

#     r = ELabFTW.send_request(api, "experiments/"; 
#         params=Dict("limit" => 15, "offset" => 0)
#     )

#     @show r
# end

@testset "Methods" begin
    experiments = get_all_experiments()

    id = first(experiments).id

    experiment = get_experiment(id)

    @show experiment

    # @show first(experiments)

    # experiments_lim = get_all_experiments(;limit=1)
    # @test length(experiments_lim) == 1

    # experiments_off = get_all_experiments(;limit=1, offset=1)
    # @test length(experiments_off) == 1
    # @test first(experiments_lim).id > first(experiments_off).id
end
