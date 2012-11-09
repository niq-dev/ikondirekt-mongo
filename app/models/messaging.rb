class Messaging
  include Mongoid::Document
  include Mongoid::Timestamps

end



class IncomeInfo
  include Mongoid::Document
  field :incoming_per_month, type: Integer
  field :outlay_per_month, type: Integer
  field :employer, type: String
  field :is_accepted, type: Boolean
  embedded_in :enquiry
end