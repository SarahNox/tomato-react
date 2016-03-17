class AddColumnToPomodoros < ActiveRecord::Migration
  def change
    add_column :pomodoros, :success, :boolean, default: true
  end
end
