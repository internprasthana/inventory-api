class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
    t.string :name
    t.string :email
    t.integer :phonenumber
    t.string :emp_id
    t.string :devices
    t.string :role

      t.timestamps
    end
  end
end
