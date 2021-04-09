class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.string :name
      t.integer :price
      t.text :description
      t.references :picture, :polymorphic => {:default => 'image'}

      t.timestamps
    end
  end
end
