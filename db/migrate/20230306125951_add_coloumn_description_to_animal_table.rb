class AddColoumnDescriptionToAnimalTable < ActiveRecord::Migration[7.0]
  def change
    add_column :animals,:description,:string
  end
end
