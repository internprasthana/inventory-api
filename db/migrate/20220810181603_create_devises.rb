class CreateDevises < ActiveRecord::Migration[6.1]
  def change
    create_table :devises do |t|
      t.string :name
      t.string :assigned_to
      t.string :devise_type
      t.string :os
      t.string :service_tag
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
