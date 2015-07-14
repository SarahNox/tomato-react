class Name < ActiveRecord::Migration
  def save
  	create_table :pomodoros do |t|
  		t.string :id
  		t.string :project
  		t.string :issue
  	end
  end
end
