class Project < ActiveRecord::Base
  belongs_to :owner, class_name: :user, foreign_key: 'owner_id'
  has_many :backers, through: :pledges, class_name: :user
end
