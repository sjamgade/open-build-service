class CreateStoredReplies < ActiveRecord::Migration[6.0]
  def up
    create_table :stored_replies, id: :integer do |t|
      t.string :reply
      t.integer :user_id
    end
    add_foreign_key :stored_replies, :users
  end

  def down 
    drop_table :stored_replies
  end
end
