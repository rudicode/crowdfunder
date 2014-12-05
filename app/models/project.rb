class Project < ActiveRecord::Base
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  has_many :pledges
  has_many :backers, through: :pledges, class_name: 'User'
  has_many :rewards
  
  accepts_nested_attributes_for :rewards, :reject_if => :all_blank

# check if there is less than one day left
# if less than day, display the Remaining hours

# if hour is <= 24 && hour >= 2 
# 		= hours
# if hour is > 24 
# 		= days
# if hour is = 1 
# 		= hour
# if hour is = 24 
# 		= day

	def remaining
		
		if (self.hours_remaining <= 24) && (self.hours_remaining >= 2)
			"#{self.hours_remaining}hours remaining"
		elsif self.hours_remaining > 24
			"#{self.days_remaining}days remaining"
		elsif self.hours_remaining = 1
			"#{self.hour_remaining}hour remaining"
		else self.hours_remaining = 24
			"#{self.hours_remaining}day remaining"		
		end

	end

	def hours_remaining
		hoursRemaining = finish_date - start_date
		(hoursRemaining / 1.hour).round
	end

	def days_remaining
		daysRemaining = finish_date - start_date
		(daysRemaining / 1.day).round
	end


end
