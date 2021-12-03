class CreateIdioms < ActiveRecord::Migration[5.0]
  def change
    create_table :idioms do |t|
      t.string :name
      t.string :pinyin
      t.text :desc

      t.timestamps
    end
  end
end
