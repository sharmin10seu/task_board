class TaskMailer < ActionMailer::Base
  default from: "team@task_board.com"

  def expire_mail(task)
    @task = task
    mail(to: 'admin@task-master.com', subject: 'Task due time expired!')
  end
end
