class CreateFriends < ActiveRecord::Migration[6.1]
  def change
    create_table :friends do |t|
      t.references :sender 
      t.references :receiver 

      t.boolean :accepted , default: false 
      
      t.timestamps
    end
  end
end
