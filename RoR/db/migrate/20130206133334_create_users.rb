class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string "username", :limit => 20
        t.string "email", :default => "", :null => false
       t.string :encrypted_password
        t.string :salt
      t.timestamps
    end
  end
end
