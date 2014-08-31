class CreateSavedMsgs < ActiveRecord::Migration
  def change
    create_table :saved_msgs do |t|
      t.string :subject
      t.text :content
      t.timestamp :time
      t.boolean :deliver
      t.string :send_num
      t.references :user

      t.timestamps
    end
  end
end
