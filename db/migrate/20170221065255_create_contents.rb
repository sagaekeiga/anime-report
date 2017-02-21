class CreateContents < ActiveRecord::Migration[5.0]
  def change
    create_table :contents do |t|
      t.text :title
      t.text :story
      t.text :broadcast
      t.text :youtube
      t.text :theme
      t.text :cast

      t.timestamps
    end
  end
end
