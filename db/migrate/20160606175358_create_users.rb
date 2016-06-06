class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :sex, null: false, default: 0
      t.date :birthday
      t.timestamps null: false

      t.index :email, unique: true
    end
  end
end
