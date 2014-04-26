class AssignmentMailer < ActionMailer::Base
  default from: "team@task_board.com"

  def assignment_mail(task_user)
    @task_user = task_user
    mail(to: @task_user.user.email, subject: 'You have been assigned a task', from: @task_user.task.user.email)
  end

  def status_mail(task)
    @task = task
    mail(to: @task.user.email, subject: 'Status changed!')
  end

end
