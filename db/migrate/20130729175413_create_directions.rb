class CreateDirections < ActiveRecord::Migration
  def change
    create_table :directions do |t|
      t.integer :step_number
      t.text :description
      t.references :recipe, index: true

      t.timestamps
    end
  end
end
