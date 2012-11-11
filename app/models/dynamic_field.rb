module DynamicField
  class FieldUnit
    include Mongoid::Document

    field :machine_name, type: String
    field :title, type: String
    field :type, type: String
    field :validation, type: Array, default: %w(required)
    field :enum, type: Array
    field :suffix, type: String
    field :prefix, type: String
    field :position, type: Integer

    embedded_in :product, inverse_of: :enquiry_field
    embedded_in :product, inverse_of: :reply_field
  end
end



