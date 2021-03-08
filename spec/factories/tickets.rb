FactoryBot.define do
  factory :ticket do
    title {"Ticket Title"}
    description {"Ticket Description"}
    due_date {Date.today}
    status_id {3}
    progress {3}
    user
  end
end