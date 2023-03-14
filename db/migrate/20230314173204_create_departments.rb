class CreateDepartments < ActiveRecord::Migration[7.0]
  def change
    create_table :departments do |t|
      t.string :name
      t.string :manager
      t.integer :code

      t.timestamps
    end
  end
end
