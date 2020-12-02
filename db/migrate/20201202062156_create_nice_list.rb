class CreateNiceList < ActiveRecord::Migration[6.0]
  def change
    create_table :nice_lists do |t|
      t.string :name
      t.string :relationship
      t.integer :nice_rating
    end
  end
end
