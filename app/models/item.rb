class Item < ActiveRecord::Base
  belongs_to :bag
  validates :name, presence: true, length: { maximum: 40 }
  validates :quantity, presence: true, :numericality => { :greater_than => 0, :less_than_or_equal_to => 50 }

  after_initialize :defaults

  def defaults
    self.status = false if self.status.nil?
  end

end
