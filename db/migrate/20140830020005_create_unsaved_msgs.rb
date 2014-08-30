class CreateUnsavedMsgs < ActiveRecord::Migration
  def change
    create_table :unsaved_msgs do |t|
      t.string :email
      t.string :phone_num
      t.string :subject
      t.text :content
      t.string :time
      t.boolean :deliver
      t.string :send_num
      t.references :no_user_logon
      
      t.timestamps
    end
  end
end
