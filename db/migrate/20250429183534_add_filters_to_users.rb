class AddFiltersToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :filter_same_school, :boolean, default: false
    add_column :users, :filter_smoking, :boolean
    add_column :users, :filter_clean, :boolean
    add_column :users, :filter_sleep, :string
  end

end
