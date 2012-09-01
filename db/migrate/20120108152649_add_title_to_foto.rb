class AddTitleToFoto < ActiveRecord::Migration
  def change
    add_column :fotos, :title, :string
  end
end
