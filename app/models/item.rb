class Item < ActiveRecord::Base
  belongs_to :bag
  validates :name, presence: true, length: { maximum: 40 }
  validates :quantity, presence: true, :numericality => { :greater_than => 0, :less_than_or_equal_to => 50 }

  after_initialize :defaults

  TEMPLATES = [ "shampoo", "soap", "brush", "toothbrush", "toothpaste", "shower gel", "perfume" ]

  def defaults
    self.status = false if self.status.nil?
  end

  def standard_item(template, bag)
  	item = bag.items.build(name: template, quantity: "1", bag_id: bag_id)
  	return item
  end

end
