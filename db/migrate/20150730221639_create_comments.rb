class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :user
      t.string :title
      t.string :body
      t.string :timestamp
      t.references :post, index: true, foreign_key: true
    end
  end
end
