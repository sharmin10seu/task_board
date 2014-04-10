class AssignmentMailer < ActionMailer::Base
  default from: "team@task-board.com"

  def assignment_mail(task_user)
    @task_user = task_user
    mail(to: @task_user.user.email, subject: 'You have been assigned a task')
  end

end
