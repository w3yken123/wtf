class CreateDistributors < ActiveRecord::Migration
  def change
    create_table :distributors do |t|
      t.string :corp_name
      t.string :corp_type
      t.string :corp_tel
      t.string :corp_contact
      t.string :corp_email
      t.string :crop_address

      t.timestamps
    end
  end
end
