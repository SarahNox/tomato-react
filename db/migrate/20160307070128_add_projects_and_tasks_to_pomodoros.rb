class AddProjectsAndTasksToPomodoros < ActiveRecord::Migration
  def change
    add_column :pomodoros, :project_id, :integer
    add_column :pomodoros, :task_id, :integer
  end
end
