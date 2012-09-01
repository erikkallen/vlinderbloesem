class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :voornaam
      t.string :achternaam
      t.string :email
      t.string :onderwerp
      t.text :bericht

      t.timestamps
    end
  end
end
