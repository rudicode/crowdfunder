  class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :owned_projects,  class_name: :project
  has_many :backed_projects, through: :pledges, class_name: :project
end
