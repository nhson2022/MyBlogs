class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :ten
      t.text :noi_dung
      t.boolean :trang_thai
      t.references :category, null: true, foreign_key: true

      t.timestamps
    end
  end
end
