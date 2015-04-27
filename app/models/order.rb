class Order < ActiveRecord::Base
  belongs_to :employee
  has_many :orderparts
end
