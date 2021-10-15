RSpec.describe 'User' , type: :model do
  context 'user with notification count' do
    let!(:user) { create(:user , send_due_date_reminder: true , due_date_reminder_time: Time.now.strftime('%H:%M')) }
    let!(:ticket) { create(:ticket,  user: user) }
    it 'return right number' do
       expect(User.with_notifications.count).to eq(1)
    end
  end

  context 'check if user notificatin time arrived' do
    let(:user_mtached) { create(:user,
                    send_due_date_reminder: true,
                    time_zone: Time.zone.name,
                    due_date_reminder_time: Time.now.strftime('%H'))
                }
    it 'return true when match time' do
       expect(user_mtached.notification_time_arrived?).to eq(true)
    end

    let(:user_not_matched) { create(:user,
                    send_due_date_reminder: true,
                    time_zone: Time.zone.name,
                    due_date_reminder_time: (Time.now + 1.hour).strftime('%H'))
                }
    it 'return false whennot matched time' do
       expect(user_not_matched.notification_time_arrived?).to eq(false)
    end
  end

  context 'check if user should notified for specific ticket' do
    let(:user_mtached) {
        create(:user,
            send_due_date_reminder: true,
            time_zone: Time.zone.name,
            due_date_reminder_interval: 0,
            due_date_reminder_time: Time.now.strftime('%H'))
    }
    let!(:ticket) { create(:ticket,  user: user_mtached, due_date: Time.zone.now.strftime("%Y-%m-%d")) }
    it 'return true when match time' do
       expect(user_mtached.should_notified_for_ticket? ticket).to eq(true)
    end

    let(:user_not_mtached) {
        create(:user,
            send_due_date_reminder: true,
            time_zone: Time.zone.name,
            due_date_reminder_interval: 1,
            due_date_reminder_time: Time.now.strftime('%H'))
    }
    it 'return false when not match time after adding interval' do
       expect(user_not_mtached.should_notified_for_ticket? ticket).to eq(false)
    end

     let(:user_not_mtached_due) {
        create(:user,
            send_due_date_reminder: true,
            time_zone: Time.zone.name,
            due_date_reminder_interval: 0,
            due_date_reminder_time: Time.now.strftime('%H'))
    }
    let!(:ticket_upcoming) { create(:ticket,  user: user_not_mtached_due, due_date: (Time.zone.now + 1.day).strftime("%Y-%m-%d")) }
    it 'return false when not match time after adding diff due date' do
       expect(user_not_mtached_due.should_notified_for_ticket? ticket_upcoming).to eq(false)
    end

    let(:user_mtached_upcoming_due_interval) {
        create(:user,
            send_due_date_reminder: true,
            time_zone: Time.zone.name,
            due_date_reminder_interval: 1,
            due_date_reminder_time: Time.now.strftime('%H'))
    }
    let!(:ticket_upcoming) {
        create(:ticket,  user: user_mtached_upcoming_due_interval, due_date: (Time.zone.now + 1.day).strftime("%Y-%m-%d"))
    }
    it 'return false when not match time after adding diff due date' do
       expect(user_mtached_upcoming_due_interval.should_notified_for_ticket? ticket_upcoming).to eq(true)
    end
  end

end