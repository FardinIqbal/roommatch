class AddFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :school, :string
    add_column :users, :bio, :text
    add_column :users, :sleep_schedule, :string
    add_column :users, :clean, :boolean
  end
end
