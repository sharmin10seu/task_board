class TaskMailer < ActionMailer::Base
  default from: "team@task_board.com"

  def expire_mail(task)
    @task = task
    mail(to: 'admin@task-master.com', subject: 'Task due time expired!')
  end

  def task_deleted_mail(task)
    @task = task
    mail(to: task.users.map(&:email), subject: 'Task removed!')
  end
end
