class CreateAnimals < ActiveRecord::Migration[7.0]
  def change
    create_table :animals do |t|
      t.string :image
      t.date :date_of_birth
      t.integer :status

      t.timestamps
    end
  end
end
