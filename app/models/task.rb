class Task < ActiveRecord::Base
	has_many :pomodoros
  belongs_to :project
  belongs_to :user
  belongs_to :project_id
end
