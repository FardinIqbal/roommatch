class CreateSwipes < ActiveRecord::Migration[7.1]
  def change
    create_table :swipes do |t|
      t.references :swiper, foreign_key: { to_table: :users }
      t.references :swiped, foreign_key: { to_table: :users }
      t.boolean :liked

      t.timestamps
    end
  end
end
