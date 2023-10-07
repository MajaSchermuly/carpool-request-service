class MakeWhitelistEmailsUnique < ActiveRecord::Migration[6.1]
  def change
    add_index :whitelists, :email, unique: true 
  end
end
