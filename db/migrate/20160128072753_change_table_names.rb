class ChangeTableNames < ActiveRecord::Migration
  def change
    rename_table :project, :projects
    rename_table :task, :tasks
  end
end
