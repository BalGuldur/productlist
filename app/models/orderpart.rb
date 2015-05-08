class Orderpart < ActiveRecord::Base
  belongs_to :order
  belongs_to :doner, class_name: "Employee"
  belongs_to :state, class_name: "Orderstate"
  belongs_to :panswtime, class_name: "Ourtime"
  belongs_to :reztime, class_name: "Ourtime"
  belongs_to :pshiptime, class_name: "Ourtime"
  belongs_to :rezpricetype, class_name: "Moneytype"

end
