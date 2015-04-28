class Order < ActiveRecord::Base
  belongs_to :manager, class_name: "Employee", foreign_key: "manager_id"
  belongs_to :doner, class_name: "Employee", foreign_key: "doner_id"
  belongs_to :purchaser
  belongs_to :statereserv

  has_many :orderparts
end
