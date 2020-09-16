class AddAttrToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :gender, :string
    add_column :users, :date_of_birth, :date
  end
end
