class Task < ActiveRecord::Base
  attr_accessible :board_id, :description, :name, :status, :doc, :user_ids
  belongs_to :board
  has_many :comments, :dependent => :destroy

  has_attached_file :doc
  do_not_validate_attachment_file_type :doc
  has_and_belongs_to_many :users

end
