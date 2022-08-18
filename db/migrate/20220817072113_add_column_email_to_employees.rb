class AddColumnEmailToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :email, :string
    add_column :employees, :designation, :string
    add_column :employees, :phone_number, :integer
    add_column :employees, :emp_id, :string
  end
end
