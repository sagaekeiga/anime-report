class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :name
      t.text :body
      t.integer :work_id
      t.integer :content_id


      t.timestamps
    end
  end
end
