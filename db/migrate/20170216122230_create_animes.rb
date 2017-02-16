class CreateAnimes < ActiveRecord::Migration[5.0]
  def change
    create_table :animes do |t|
      t.text :title
      t.text :content

      t.timestamps
    end
    add_index :animes, [:title, :created_at]
  end
end
