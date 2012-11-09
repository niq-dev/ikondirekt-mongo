module Location
  class State
    include Mongoid::Document

    field :code, type: Integer
    field :name, type: String
    field :language, type: String

    has_many :regions, :class_name => 'Location::Region', :inverse_of => :state

    validates :code, presence: true, numericality: {only_integer: true}, length: {minimum: 1, maximum: 8}
    validates :name, presence: true, length: {minimum: 2}
    validates :language, presence: true, length: {minimum: 2, maximum: 3}

  end
end