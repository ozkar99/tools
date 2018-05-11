class CreatePasswords < ActiveRecord::Migration[5.2]
  def change
    create_table :passwords do |t|
      t.string :name
      t.string :description
      t.string :url
      t.string :login
      t.string :encrypted_password
      t.string :encrypted_password_iv

      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
