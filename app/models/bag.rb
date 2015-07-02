class Bag < ActiveRecord::Base
	belongs_to :user
	has_many :items, dependent: :destroy

  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 40 }

  TEMPLATES = { 
  							weekend: { 
  								name: "weekend trip", 
  								items: { "socks" => 3, "pants" => 1, "shirts" => 2, "sleeping bag" => 1, "umbrella" => 1}
  							},
  							beach: {
  								name: "Beach trip", 
  								items: { "swimsuit" => 1, "towel" => 1, "flipflops" => 1, "sunblock" => 1, "book" => 1}
  							},
  							ski: {
  								name: "Ski trip",
  								items: { "ski" => 1, "ski suit" => 1, "sunglasses" => 1, "sunblock" => 1, "helmet" => 1}
								},
								conference: {
									name: "Conference", 
									items: { "laptop" => 1, "laptop charger" => 1, "sticker" => 10, "USB stick" => 2, "Club Mate" => 4}
								},
								city: {
									name: "City", 
									items: { "laptop" => 1, "laptop charger" => 1, "suit" => 1, "opera tickets" => 2, "champagne" => 1}
								} 
							}

  def duplicate_items
  	self.items.map do |item| 
			item.dup
		end
	end

	def standard_items(items)
		items.each do |name, quantity|
			item = self.items.build(name: name, quantity: quantity, bag_id: self.id)
		end
	end

	def duplicate 
		new_bag = self.dup
		new_bag.items = self.duplicate_items
		return new_bag
	end

	def standard_bags(template, user)
		bag = user.bags.build(name: template[:name])
		bag_items = template[:items]
		bag_items.each do |name, quantity|
			@item = bag.items.build(name: name, quantity: quantity, bag_id: bag.id)
		end 
		return bag
  end 

  def reset 
  	self.items.each do |item|
			item.update_attributes(status: false)	
		end
	end 

end