class AddAttachmentAvatarToClients < ActiveRecord::Migration
  def self.up
    change_table :clients do |t|
      t.attachment :avatar
      #Also include avatars from oauth
      t.string :oauth_avatar
    end
  end

  def self.down
    remove_attachment :clients, :avatar
    t.remove :oauth_avatar
  end
end
