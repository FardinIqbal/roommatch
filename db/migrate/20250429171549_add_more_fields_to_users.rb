class AddMoreFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :major, :string
    add_column :users, :year_in_school, :string
    add_column :users, :hobbies, :text
    add_column :users, :guest_policy, :string
    add_column :users, :smoking, :boolean
    add_column :users, :pets, :boolean
  end
end
