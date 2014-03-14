class AddDocToTasks < ActiveRecord::Migration
  def self.up
    add_attachment :tasks, :doc
  end

  def self.down
    remove_attachment :tasks, :doc
  end
end
