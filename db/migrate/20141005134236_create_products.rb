class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :handle
      t.integer :pid

      t.timestamps
    end
  end
end
