class Project < ActiveRecord::Base
	has_many :pomodoros
  has_many :tasks
  belongs_to :user
  validates :user, presence: true

end

