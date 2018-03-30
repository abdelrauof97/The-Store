class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :carts
  belongs_to :current_cart, class_name: "Cart", foreign_key: 'current_cart_id'
  has_many :line_items

  def create_current_card
    current_cart = Cart.create(user_id: self.id)
    self.current_cart = current_cart
    self.save
    current_cart
  end

end
