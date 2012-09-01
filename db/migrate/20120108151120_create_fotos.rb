class CreateFotos < ActiveRecord::Migration
  def change
    create_table :fotos do |t|
      t.has_attached_file :foto
      t.timestamps
    end
  end
end
