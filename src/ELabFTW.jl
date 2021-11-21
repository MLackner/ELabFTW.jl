module ELabFTW

using Dates
using HTTP
using JSON3
using StructTypes

function __init__()
  global BASE_API = BaseAPI(
		endpoint = ENV["ELABFTW_ENDPOINT"],
	 	token = ENV["ELABFTW_API_KEY"]
	)
end

include("request.jl")
include("experiment.jl")
include("item.jl")
include("template.jl")
include("api.jl")

export Experiment, Item, Template
export create_experiment, create_item, create_template
export get_all_experiments, get_experiment
export get_all_items, get_item, get_item_types
export get_all_templates, get_template
export get_tags, get_upload, get_status
export post_experiment, post_item, post_template
export add_link_to_experiment, add_link_to_item
export upload_to_experiment, upload_to_item
export add_tag_to_experiment, add_tag_to_item

end #module
