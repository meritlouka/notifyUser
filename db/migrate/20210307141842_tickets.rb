class Tickets < ActiveRecord::Migration[5.2]
  def change
        create_table :tickets do |t|
          t.string :title
          t.text :description
          t.date :due_date
          t.integer :status_id
          t.integer  :progress
          t.timestamps
        end
        add_reference :tickets, :assigned_user, foreign_key: { to_table: :users }
  end
end
