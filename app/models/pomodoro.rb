class Pomodoro < ActiveRecord::Base
	validates :project, presence: true, length: { maximum: 50 }
end
