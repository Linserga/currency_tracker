class Visit < ActiveRecord::Base
  attr_accessible :country_id, :user_id
  belongs_to :user
  belongs_to :country
end
