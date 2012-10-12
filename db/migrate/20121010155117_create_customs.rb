class CreateCustoms < ActiveRecord::Migration
  def change
    create_table :customs do |t|
      t.string :c_name
      t.date :c_birthday
      t.string :c_email
      t.string :c_tel

      t.timestamps
    end
  end
end
