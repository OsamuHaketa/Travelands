class ChangeCloumnsNotnullAddTags < ActiveRecord::Migration[6.1]
  def change
    change_column :tags, :tagname, :string, null: false
  end
end
