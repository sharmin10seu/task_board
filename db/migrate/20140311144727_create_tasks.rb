class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :name
      t.text :description
      t.integer :board_id

      t.timestamps
    end
  end
end
