class AddProjectsAndTasks < ActiveRecord::Migration
  def change
    create_table :projects do |t|
       t.integer :user_id, null: false
       t.string :name, null: false
       t.timestamps null: false
    end

    create_table :tasks do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.integer :project_id, null: false
      t.timestamps null: false
    end  
  end
end
