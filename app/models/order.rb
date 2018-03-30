class Order < ActiveRecord::Base

  belongs_to :line_items

end
