class Project < ActiveRecord::Base
  belongs_to :owner, class_name: :user
  has_many :backers, through: :pledges, class_name: :user
end
