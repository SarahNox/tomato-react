class Pomodoro < ActiveRecord::Base
	belongs_to :user
	validates :project, presence: true, length: { maximum: 50 }
	validates :user, presence: true

	def self.daily_pomodoros(user)
		user.pomodoros.where("created_at >= ?", Time.zone.now.beginning_of_day).page(1).per(16)
	end	

end
