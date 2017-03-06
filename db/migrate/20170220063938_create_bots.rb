class CreateBots < ActiveRecord::Migration[5.0]
  def change
    create_table :bots do |t|
      t.text :title
      t.text :url
      t.text :page_id
      t.date :date

      t.timestamps
    end
  end
end