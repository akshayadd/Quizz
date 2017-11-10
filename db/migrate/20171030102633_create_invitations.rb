class CreateInvitations < ActiveRecord::Migration[5.1]
  def change
    create_table :invitations do |t|
      t.integer  :user_id
      t.string   :reffer_number,            null: false
      t.boolean  :invitation_accept,        default: false
      t.datetime :invitation_accepted_at
      t.string   :invitation_token

      t.timestamps
    end
  end
end
