class CreateWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :works do |t|
      t.text :main_title
      t.text :sub_title
      t.text :content
      t.text :youtube
      t.date :date

      t.timestamps
    end
  end
end
