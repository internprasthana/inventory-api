class CreateUserRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :user_roles do |t|
      t.string :roles
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
