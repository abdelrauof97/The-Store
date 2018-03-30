class Order < ActiveRecord::Base

  belongs_to :user
  belongs_to :item
  has_many :orders
  has_many :users, through: :users

end
