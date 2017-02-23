class CreateAnimes < ActiveRecord::Migration[5.0]
  def change
    create_table :animes do |t|
      t.text :title
      t.text :youtube
      t.text :fc2
      t.text :ani
      t.text :hima
      t.text :gogo
      t.text :nova
      t.text :gooda
      t.text :kiss
      t.text :myvi
      t.text :b9
      t.text :daily
      t.text :miomio
      t.text :smove
      t.date :date

      t.timestamps
    end
    add_index :animes, [:title, :created_at]
  end
end
