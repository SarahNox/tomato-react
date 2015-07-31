class CreatePomodoros < ActiveRecord::Migration
  def change
    create_table :pomodoros do |t|
    	t.references :user, index: true
        t.timestamps null: false
    end
  end
end
