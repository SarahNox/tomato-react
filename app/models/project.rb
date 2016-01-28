class Project < ActiveRecord::Base
	has_many :pomodoro
  has_many :task
 #  validates :user, presence: true

end



# Project:  id: 1, pomodoro_id: 3, name: 'programming'
# Pomodor id: 3, timestamp: "2010-12-20"

# Pomodoro id: 4, timestamp: |"2015-12-27"
# Project id: 2, pomodor_id: 4, name: "programming"


# [ ] Remove project name text field from pomodoros
# [ ] Remove project name text field from pomodoros
# [ ] Add Projects to database
# [ ] Add Tasks to database
# [ ] Add project_id and task_id to pomodoros table
# [ ] Setup proper belongs_to, has_many relationships in the models
#   * project <-> Tasks
#   * project <-> pomodoros
#     * task <-> pomodoros