class CreateBeers < ActiveRecord::Migration[7.0]
  def change
    create_table :beers do |t|
      t.string :name
      t.string :brewer
      t.string :type
      t.text :description
      t.text :image

      t.timestamps
    end
  end
end
