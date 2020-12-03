class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :name
      t.string :relationship
      t.string :nice_rating
      t.string :naughty_rating
      t.integer :user_id
    end
  end
end
