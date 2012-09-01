class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :button_text
      t.text :content
      t.string :image
      t.boolean :on_homepage

      t.timestamps
    end
  end
end
