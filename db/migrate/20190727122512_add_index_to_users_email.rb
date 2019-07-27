class AddIndexToUsersEmail < ActiveRecord::Migration[5.1]
  
  # In case of request using same email is submitted twice in a very short time, add index to email to ensure unqiueness
  def change
    add_index :users, :email, unique: true
  end
end
