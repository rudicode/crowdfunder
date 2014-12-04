class Project < ActiveRecord::Base
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  has_many :pledges
  has_many :backers, through: :pledges, class_name: 'User'
  has_many :rewards
  
  accepts_nested_attributes_for :rewards, :reject_if => :all_blank
end
