class RemoveReferenceEmployeesDevices < ActiveRecord::Migration[6.1]
  def change
    remove_reference :devices, :employee, foreign_key: true
  end
end
