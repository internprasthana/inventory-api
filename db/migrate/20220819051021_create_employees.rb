class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.bigint :phone_number
      t.string :emp_id
      t.string :designation

      t.timestamps
    end
  end
end
