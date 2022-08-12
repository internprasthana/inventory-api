class CreateDevices < ActiveRecord::Migration[6.1]
  def change
    create_table :devices do |t|
      t.string :name
      t.string :assigned_to
      t.string :device_type
      t.string :os
      t.string :service_tag

      t.timestamps
    end
  end
end
