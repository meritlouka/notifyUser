
RSpec.describe 'Notification:NotifyUser', type: :model do

  describe '#call' do
    include ActiveJob::TestHelper
    let!(:user_1) { create(:user ,time_zone: Time.zone.name, send_due_date_reminder: true, due_date_reminder_time: Time.zone.now.strftime('%H:%M')) }
    let!(:ticket_1) { create(:ticket,  user: user_1) }

    let!(:user_2) { create(:user , time_zone: Time.zone.name, send_due_date_reminder: true, due_date_reminder_interval: 1 , due_date_reminder_time: Time.zone.now.strftime('%H:%M')) }
    let!(:ticket_2) { create(:ticket,due_date: Date.tomorrow,  user: user_2) }

    before do
      ActiveJob::Base.queue_adapter = :test
      clear_enqueued_jobs
    end

    after do
      clear_enqueued_jobs
    end

    it 'enque one emails' do
      Notification::NotifyUser.new().call
      expect(enqueued_jobs.size).to eq(2)
    end


  end
end