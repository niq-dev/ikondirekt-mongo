class Messaging
  include Mongoid::Document
  include Mongoid::Timestamps

end



class IncomeInfo
  include Mongoid::Document
  field :av_expense_per_month, type: Integer
  field :employee, type: String
  field :salary_per_month, type: Integer
  field :state, type: String
  field :visible_online, type: String

  belongs_to :enquiry
end