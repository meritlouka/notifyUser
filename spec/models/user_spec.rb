RSpec.describe 'User' , type: :model do
  context 'user with notification count' do
    let!(:user_1) { create(:user , send_due_date_reminder: true , due_date_reminder_time: Time.now.strftime('%H:%M')) }
    let!(:ticket_1) { create(:ticket,  user: user_1) }
    it 'return rigt number' do
       expect(User.with_notifications.count).to eq(1)
    end
  end


end