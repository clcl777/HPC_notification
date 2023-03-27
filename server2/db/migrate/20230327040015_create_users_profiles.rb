class CreateUsersProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :users_profiles do |t|
      t.string :line_id
      t.string :display_name
      t.string :picture_url
      t.string :status_message

      t.timestamps
    end
  end
end
