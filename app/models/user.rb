class User < ActiveRecord::Base
  has_many :bags, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Defines a list of all the user's bags       
  def list
  	Bags.where("user_id = ?", id)
  end

end