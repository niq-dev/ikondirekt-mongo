class Product
  include Mongoid::Document

  field :name, type: String
  field :required_incoming, type: Boolean, default: false

  has_many :enquiries, :autosave => true
  belongs_to :category, class_name: "ProductCategory"
  embeds_many :enquiry_fields, class_name: "DynamicField::FieldUnit"
  embeds_many :reply_fields, class_name: "DynamicField::FieldUnit"
  has_and_belongs_to_many :companies, :autosave => true

  accepts_nested_attributes_for :enquiry_fields
  accepts_nested_attributes_for :reply_fields

end
