class CreatePlants < ActiveRecord::Migration[6.0]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :uses
      t.string :extraction_methods
      t.string :effects
      t.string :growing_zone
      t.string :image
      t.string :description
      t.string :interactions

      t.timestamps
    end
  end
end
