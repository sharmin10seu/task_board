class Task < ActiveRecord::Base
  attr_accessible :board_id, :description, :name, :status, :doc
  belongs_to :board

  has_attached_file :doc
  do_not_validate_attachment_file_type :doc

end
