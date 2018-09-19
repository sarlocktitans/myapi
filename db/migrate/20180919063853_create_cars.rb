class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string  :name ,				null: false, default: ""
      t.integer :price,				null: false, default: ""
      t.string  :location,			null: false, default: ""
      t.boolean :is_featured,		null: false, default: ""
      t.string  :image,				null: false, default: ""
      t.string  :model,				null: false, default: ""
      t.date    :registration_date, null: false, default: ""
      t.string  :description,		null: false, default: ""
      t.string  :manufacturer,		null: false, default: ""
      t.timestamps
    end
  end
end
