class Tag
  include Mongoid::Document
  acts_as_nested_set
  field :name, type: String
end
