class CreateCharts < ActiveRecord::Migration[7.0]
  def change
    create_table :charts do |t|
      t.string :name
      t.integer :sales
      t.integer :customers

      t.timestamps
    end
  end
end
