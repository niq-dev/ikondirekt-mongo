class Topic
  include Mongoid::Document

  field :name, type: String
  field :body, type: String

  belongs_to :category, class_name: "TopicCategory"
  accepts_nested_attributes_for :category

end
