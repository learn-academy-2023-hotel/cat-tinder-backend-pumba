class AddLocationColumnToTable < ActiveRecord::Migration[7.1]
  def change
    add_column :dogs, :location, :string
  end
end
