class User < ActiveRecord::Base
	has_many :visits
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  def count_visited
  	self.visits.count
  end

  def count_not_visited
  	Country.count - self.visits.count
  end

  def visited? id
  	self.visits.where(country_id: id).empty? ? false : true
  end
end
