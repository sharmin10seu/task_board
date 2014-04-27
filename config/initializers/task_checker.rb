require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

scheduler.every '60s' do
  Task.where("due_time < ? AND expired_mail_sent_at IS NULL", Time.now).each do |task|
    TaskMailer.expire_mail(task).deliver
    task.update_attribute(:expired_mail_sent_at, Time.now)
  end
end