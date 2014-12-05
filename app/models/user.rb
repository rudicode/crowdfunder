  class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :owned_projects,  class_name: "Project", foreign_key: "owner_id"
  has_many :backed_projects, through: :pledges, source: "project" #foreign_key: "owner_id"
  has_many :pledges

  validates :password, length: { minimum: 1 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :email, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  def users_backed_projects
    current_user.backed_projects
  end
end
