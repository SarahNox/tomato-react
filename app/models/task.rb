class Task < ActiveRecord::Base
	has_many :pomodoros
  belongs_to :project
 #  validates :project, presence: true, length: { maximum: 50 }
 #  validates :user, presence: true

end
