class CreateGifts < ActiveRecord::Migration[6.0]
  def change
    create_table :gifts do |t|
      t.string :name
      t.integer :cost
      t.string :notes
      t.integer :user_id
      t.integer :person_id
    end
  end
end
