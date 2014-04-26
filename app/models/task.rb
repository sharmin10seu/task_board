class Task < ActiveRecord::Base
  attr_accessible :board_id, :description, :name, :status, :doc, :user_ids, :due_time, :task_time
  belongs_to :board
  belongs_to :user

  has_many :comments, :dependent => :destroy

  has_attached_file :doc
  do_not_validate_attachment_file_type :doc

  has_many :task_users
  has_many :users, :through => :task_users
  attr_reader :task_time

  after_update :send_task_status_mail

  def task_time=(time)
    if self.due_time.present? && time.present?
      self.due_time = "#{self.due_time.strftime("%Y-%m-%d")} #{time}"
    end
  end

  def task_time
    self.due_time.strftime("%I:%M %P") if self.due_time
  end

  private
  def send_task_status_mail
    if self.status_changed?
      AssignmentMailer.status_mail(self).deliver
    end
  end

end
