class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :body
      t.belongs_to :support_conversation, foreign_key: true
      t.belongs_to :client, :stores, column: :uuid

      t.timestamps
    end

    #Paperclip Upload
    add_attachment :messages, :attached_image

  end 
end
