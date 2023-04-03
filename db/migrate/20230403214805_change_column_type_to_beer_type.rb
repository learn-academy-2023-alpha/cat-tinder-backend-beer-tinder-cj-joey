class ChangeColumnTypeToBeerType < ActiveRecord::Migration[7.0]
  def change
    rename_column :beers, :type, :beer_type
  end
end
