@Base.kwdef struct BaseAPI
	token::String = ""
	endpoint::String = ""
	proxy::Union{Nothing,String} = nothing
	# verify TLS certificate?
	verify::Bool = true
end

function send_request(api::BaseAPI, url::String, data::IO;)
	url = api.endpoint * url

	body = Dict(
		:file => data,
		:name => "file", # what does this do?
	) |> HTTP.Form

	HTTP.request("POST", url,
		verbose=2,
		require_ssl_verification = api.verify,
		proxy = api.proxy,
		headers = ["Authorization" => api.token],
		body=body
	)
end

function send_request(api::BaseAPI, url::String; 
			query=Dict(), 
			body=HTTP.Form(Dict()),
			verb="GET", 
		)

	url = api.endpoint * url

	HTTP.request(
		verb, 
		url;
		body=body,
		query=query,
		verbose=2,
		require_ssl_verification = api.verify,
		proxy = api.proxy,
		headers = ["Authorization" => api.token]
	)
end

to_json(r::HTTP.Messages.Response) = r.body |> String |> JSON3.read

function parse_response(r::HTTP.Messages.Response, ::Type{T}) where T 
	JSON3.read(r.body, T;
		parsequoted=true,
		dateformat=dateformat"yyyy-mm-dd HH:MM:ss"
	)
end

function struct_to_form_data(s::T) where T
	# HTTP.Form() seems to be stupid and can't handle DateTime and Nothing types.
	# we filter these out.
	dict = Dict(key => getfield(s, key) for key in fieldnames(T) if !isnothing(getfield(s, key)) && key ∉ [:lastchange])
	HTTP.Form(dict)
end