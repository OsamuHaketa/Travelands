class CreateTagmaps < ActiveRecord::Migration[6.1]
  def change
    create_table :tagmaps do |t|
      t.integer :tag_id, null: false
      t.integer :post_id, null: false
      t.timestamps
    end
  end
end
