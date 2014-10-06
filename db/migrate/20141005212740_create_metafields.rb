class CreateMetafields < ActiveRecord::Migration
  def change
    create_table :metafields do |t|
      t.integer :pid
      t.string :namespace
      t.string :key
      t.string :value
      t.belongs_to :product, index: true
      t.timestamps
    end
  end
end
