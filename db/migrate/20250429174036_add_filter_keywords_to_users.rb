class AddFilterKeywordsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :filter_keywords, :text
  end
end
