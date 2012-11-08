class ProductCategory
  include Mongoid::Document

  acts_as_nested_set

  field :name, type: String

  has_many :products, inverse_of: :category

  def leaves_or_self
    rs = leaves.empty??Array[self]:leaves
  end

  def self.all_leaves
    result = []
    ProductCategory.roots.map{|r| result+=r.leaves_or_self}
    result
  end

end