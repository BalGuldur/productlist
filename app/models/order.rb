class Order < ActiveRecord::Base
  belongs_to :manager, class_name: "Employee"
  belongs_to :doner, class_name: "Employee"
  belongs_to :orderstate

  has_many :orderparts

end
