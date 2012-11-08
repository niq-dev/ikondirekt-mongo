class TopicCategory
  include Mongoid::Document

  acts_as_nested_set

  field :name, type: String

  has_many :topics, :inverse_of => :category
end
