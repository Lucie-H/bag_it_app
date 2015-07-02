class Item < ActiveRecord::Base
  belongs_to :bag
  validates :name, presence: true, length: { maximum: 40 }
  validates :quantity, presence: true, :numericality => { :greater_than => 0, :less_than_or_equal_to => 50 }

  after_initialize :defaults

  TOILETRY = [ "shampoo", "soap", "brush", "toothbrush", "toothpaste", "bodywash", "perfume" ]
  CLOTHES = [ "socks", "underwear", "pants", "dress", "shirt", "suit", "coat", "scarf", "hat" ]
  EQUIPMENT = [ "umbrella", "travel guide", "plane ticket", "train ticket", "hotel reservation" ]
  GADGETS = [ "laptop", "laptop charger", "USB key", "phone charger", "camera", "camera charger", "camera battery" ]
  ENTERTAINMENT = [ "ebook", "book", "magazine", "handheld console" ]

  def defaults
    self.status = false if self.status.nil?
  end

  def standard_item(template, bag)
  	item = bag.items.build(name: template, quantity: "1", bag_id: bag_id)
  	return item
  end

end
