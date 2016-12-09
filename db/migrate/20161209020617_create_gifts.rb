class CreateGifts < ActiveRecord::Migration[5.0]
  def change
    create_table :gifts do |t|
      t.references :user, foreign_key: true
      t.string :gif

      t.timestamps
    end
  end
end
