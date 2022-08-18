class AddColumnPhoneNumberToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :phone_number, :bigint
  end
end
