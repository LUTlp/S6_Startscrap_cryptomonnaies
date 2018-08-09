class CreateCryptoms < ActiveRecord::Migration[5.2]
  def change
    create_table :cryptoms do |t|
      t.string :nomcrypto
      t.string :prixcrypto

      t.timestamps
    end
  end
end
