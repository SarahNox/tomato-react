class Project < ActiveRecord::Base
	has_many :pomodoros
  has_many :tasks
 #  validates :user, presence: true

end

