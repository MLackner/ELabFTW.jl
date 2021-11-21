"""
Create an experiment
"""
function create_experiment(api::BaseAPI=BASE_API)::Int
	response = send_request(api, "experiments"; verb="POST")
	# JSON RESPONSE:
	# {"result":"success","id":147}
	to_json(response)["id"]
end

"""
Create an item where `id` is the `items_types` id.
"""
function create_item(id::T, api::BaseAPI=BASE_API) where T <: Integer
	response = send_request(api, "items/$(id)"; verb="POST")
	to_json(response)
end

"""
Create a template
"""
function create_template(api::BaseAPI=BASE_API)
	response = send_request(api, "templates"; verb="POST")
end

"""
Returns an array with all experiments.

## Keyword Arguments
"""
function get_all_experiments(api::BaseAPI=BASE_API; limit=15, offset=0)
	params = Dict(
		"limit" => limit,
		"offset" => offset,
	) |> HTTP.Form

	response = send_request(api, "experiments/"; body=params)
	parse_response(response, Vector{Experiment})
end

"""
Return the `Experiment` with id `id`.
"""
function get_experiment(id::T, api::BaseAPI=BASE_API) where T <: Integer
	response = send_request(api, "experiments/$(id)")
	parse_response(response, Experiment)
end

"""
Return all items.

## Keyword Arguments
"""
function get_all_items(api::BaseAPI=BASE_API; limit=15, offset=0)
	params = Dict(
		:limit => limit,
		:offset => offset,
	)

	response = send_request(api, "items/"; query=params)
	parse_response(response, Vector{Item})
end

"""
Return the `Item` with id `id`.
"""
function get_item(id::T, api::BaseAPI=BASE_API) where T <: Integer
	response = send_request(api, "items/$(id)")
	parse_response(response, Experiment)
end

function get_item_types(api::BaseAPI=BASE_API)
	send_request(api, "item_types/")
end

function get_tags(api::BaseAPI=BASE_API)
	response = send_request(api, "tags/")
end

function get_upload(id::T, api::BaseAPI=BASE_API) where T <: Integer
	send_request(api, "uploads/$(id)")
end

function get_status(api::BaseAPI=BASE_API)
	send_request(api, "status/")
end

function get_all_templates(api::BaseAPI=BASE_API)
	response = send_request(api, "templates/")
end

function get_template(id::T, api::BaseAPI=BASE_API) where T <: Integer
	response = send_request(api, "templates/$(id)")
end

function post_experiment(x::Experiment, api::BaseAPI=BASE_API)
	body = struct_to_form_data(x)
	response = send_request(api, "experiments/$(x.id)"; verb="POST", body=body)
end

function post_item(x::Item, api::BaseAPI=BASE_API)
	body = struct_to_form_data(x)
	response = send_request(api, "items/$(x.id)"; verb="POST", body=body)
end

function post_template(x::Template, api::BaseAPI=BASE_API)
	body = struct_to_form_data(x)
	response = send_request(api, "templates/$(x.id)"; verb="POST", body=body)
end

function add_link_to_experiment(experiment_id::T, item_id::T, api::BaseAPI=BASE_API) where T <: Integer
	@show body = Dict("link" => item_id) |> HTTP.Form
	response = send_request(api, "templates/$(experiment_id)"; 
		verb="POST", body=body
	)
end

function add_link_to_experiment(x::Experiment, y::Item, api::BaseAPI=BASE_API)
	add_link_to_experiment(x.id, y.id, api)
end

function add_link_to_item(item_id::T, link_id::T, api::BaseAPI=BASE_API) where T <: Integer
	body = Dict("link" => link_id) |> HTTP.Form
	response = send_request(api, "items/$(item_id)"; verb="POST", body=body)
end

function add_link_to_item(x::Item, link::Item, api::BaseAPI=BASE_API) where T <: Integer
	add_link_to_item(x.id, link.id, api)
end

function add_link_to_experiment(x::Experiment, y::Item, api::BaseAPI=BASE_API)
	add_link_to_experiment(x.id, y.id, api)
end

function upload_to_experiment(x::Experiment, data::IO, api::BaseAPI=BASE_API)
	upload_to_experiment(x.id, data, api)
end

function upload_to_experiment(experiment_id::T, data::IO, api::BaseAPI=BASE_API) where T <: Integer
	response = send_request(api, "experiments/$(experiment_id)", data)
end

function upload_to_item(x::Item, data::IO, api::BaseAPI=BASE_API)
	upload_to_item(x.id, data, api)
end

function upload_to_item(item_id::T, data::IO, api::BaseAPI=BASE_API) where T <: Integer
	response = send_request(api, "items/$(item_id)", data)
end

function add_tag_to_experiment(x::Experiment, tag::Union{Symbol,String}, api::BaseAPI=BASE_API) where T
	add_tag_to_experiment(x.id, tag, api)
end

function add_tag_to_experiment(id::T, tag::Union{Symbol,String}, api::BaseAPI=BASE_API) where T
	body = Dict("tag" => tag) |> HTTP.Form
	send_request(api, "experiments/$(id)"; verb="POST", body=body)
end

function add_tag_to_item(x::Item, tag::Union{Symbol,String}, api::BaseAPI=BASE_API) where T
	add_tag_to_item(x.id, tag, api)
end

function add_tag_to_item(id::T, tag::Union{Symbol,String}, api::BaseAPI=BASE_API) where T
	body = Dict("tag" => tag) |> HTTP.Form
	send_request(api, "items/$(id)"; verb="POST", body=body)
end