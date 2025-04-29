class CreateSwipes < ActiveRecord::Migration[7.1]
  def change
    create_table :swipes do |t|
      t.references :swiper, null: false, foreign_key: true
      t.references :swiped, null: false, foreign_key: true
      t.boolean :liked

      t.timestamps
    end
  end
end
