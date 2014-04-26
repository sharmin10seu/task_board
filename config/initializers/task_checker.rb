require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

scheduler.every '60s' do
  Task.where("due_time < ?", Time.now).each do |task|
    TaskMailer.expire_mail(task).deliver
  end
end