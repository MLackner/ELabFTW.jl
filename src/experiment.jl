mutable struct Experiment
	id::Int64
	title::String
  date::String # e.g. "20211121"
  category::String # e.g "Running"
  rating::Int64 # e.g "0"
  userid::Int64 # e.g "46"
  locked::Int8 # e.g "0"
  canread::String # e.g "team"
  canwrite::String # e.g "user"
  lastchange::DateTime
  up_item_id::Union{Nothing,Any}
  has_attachment::Union{Nothing,Any}
  next_step::Union{Nothing,Any}
  category_id::Int64 # e.g "10"
  color::String # e.g "29AEB9"
  fullname::String # e.g "John Doe"
  recent_comment::Union{Nothing,Any}
  has_comment::Int8 # e.g "0"
  timestamped::Int8 # e.g "0"
end

# we need this to parse json strings as Julia structs
StructTypes.StructType(::Type{Experiment}) = StructTypes.Struct()

Base.show(io::IO, x::Experiment) = print(io, 
"""
$(typeof(x)):
id: $(x.id) title: $(x.title)
""")