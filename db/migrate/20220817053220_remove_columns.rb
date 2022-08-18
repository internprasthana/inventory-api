class RemoveColumns < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :username, :string
    remove_column :users, :role, :string
    remove_column :employees, :phonenumber, :integer
    add_column :employees, :phonenumber, :bigint
    add_reference :users, :employee, foreign_key: true
    remove_reference :devises, :employee
    add_reference :devises, :employee, foreign_key: true


  end
end
