class AddImageToPage < ActiveRecord::Migration
  def change
    change_table :pages do |t|
      t.has_attached_file :foto
    end
  end
end