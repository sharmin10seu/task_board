class TaskUser < ActiveRecord::Base
  set_table_name "tasks_users"
  attr_accessible :task_id, :user_id
  belongs_to :task
  belongs_to :user

  after_create :send_assignment_mail

  private
  def send_assignment_mail
    AssignmentMailer.assignment_mail(self).deliver
  end

end
