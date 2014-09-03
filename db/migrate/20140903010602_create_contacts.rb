class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.references :user, index: true
      t.string :first_name
      t.string :last_name
      t.string :phone_num
      t.timestamps
    end
  end
end
