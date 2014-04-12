class Task < ActiveRecord::Base
  attr_accessible :board_id, :description, :name, :status, :doc, :user_ids
  belongs_to :board
  belongs_to :user

  has_many :comments, :dependent => :destroy

  has_attached_file :doc
  do_not_validate_attachment_file_type :doc

  has_many :task_users
  has_many :users, :through => :task_users

  after_update :send_task_status_mail

  private
  def send_task_status_mail
    if self.status_changed?
      AssignmentMailer.status_mail(self).deliver
    end
  end

end
