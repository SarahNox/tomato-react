class Pomodoro < ActiveRecord::Base
	belongs_to :user
	validates :project, presence: true, length: { maximum: 50 }
	validates :user, presence: true
end
