class Pomodoro < ActiveRecord::Base
	belongs_to :user
  belongs_to :project
  belongs_to :task
	validates :project, presence: true, length: { maximum: 50 }
	validates :user, presence: true
  validates :task, presence: true

	def self.daily_pomodoros(user)
		user.pomodoros.where("created_at >= ?", Time.zone.now.beginning_of_day).page(1).per(16)
	end	

end
