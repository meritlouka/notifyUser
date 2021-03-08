
RSpec.describe 'Notification:NotifyUser', type: :model do

  describe '#call' do
    include ActiveJob::TestHelper
    let!(:user_1) { create(:user) }
    let!(:ticket_1) { create(:ticket,  user: user_1) }

    before do

      ActiveJob::Base.queue_adapter = :test
      clear_enqueued_jobs
    end

    after do
      clear_enqueued_jobs
    end

    it 'enque emails' do
       Notification::NotifyUser.new().call
       expect(enqueued_jobs.size).to eq(1)
    end
  end
end