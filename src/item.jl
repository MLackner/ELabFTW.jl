struct Item
	id::Int
  title::String
	date::String
	category::String
	rating::Int
	userid::Int
	locked::Any
	canread::String
	canwrite::String
	lastchange::DateTime
	up_item_id::Any
	has_attachment::Any
	next_step::Any
	category_id::Int
	color::String
	fullname::String
	recent_comment::Any
	has_comment::Int
	bookable::Int
end

# we need this to parse json strings as Julia structs
StructTypes.StructType(::Type{Item}) = StructTypes.Struct()