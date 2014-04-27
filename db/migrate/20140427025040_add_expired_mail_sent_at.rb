class AddExpiredMailSentAt < ActiveRecord::Migration
  def up
    add_column :tasks, :expired_mail_sent_at, :datetime
  end

  def down
    remove_column :tasks, :expired_mail_sent_at
  end
end
