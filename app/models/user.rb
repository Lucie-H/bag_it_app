class User < ActiveRecord::Base
  has_many :bags, dependent: :destroy
  has_many :items, through: :bags, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end