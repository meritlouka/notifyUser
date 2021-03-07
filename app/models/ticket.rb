class Ticket < ApplicationRecord
    belongs_to :user , foreign_key: 'assigned_user_id'
end
