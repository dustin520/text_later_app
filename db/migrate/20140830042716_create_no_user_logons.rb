class CreateNoUserLogons < ActiveRecord::Migration
  def change
    create_table :no_user_logons do |t|

      	t.timestamps
    end
  end
end
