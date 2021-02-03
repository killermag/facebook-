# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :username,           null: false 
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :image 

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      t.string :provider 



      ## Rememberable
      t.datetime :remember_created_at

      ## User attributes 
      t.string :first 
      t.string :last 

      t.timestamps null: false
    end

    
    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
