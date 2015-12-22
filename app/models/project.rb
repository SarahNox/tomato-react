class Project < ActiveRecord::Base
	has_many :pomodoro
  validates :user, presence: true

end
