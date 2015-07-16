class AddProjectToPomodoros < ActiveRecord::Migration
  def change
  	add_column :pomodoros, :project, :text
  	add_column :pomodoros, :issue, :text
  end
end
