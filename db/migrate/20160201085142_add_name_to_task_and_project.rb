class AddNameToTaskAndProject < ActiveRecord::Migration
  def change
    add_column :projects, :name, :string
    add_column :tasks, :name, :string
  end
end
