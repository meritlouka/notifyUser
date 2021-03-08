RSpec.describe 'Ticket', type: :model do           #
  context 'before publication' do
    it 'cannot have comments' do
      t = create(:ticket)

    end
  end
end