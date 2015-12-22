class Issue < ActiveRecord::Base
	belongs_to :pomodoro
  validates :project, presence: true, length: { maximum: 50 }
  validates :user, presence: true

end
