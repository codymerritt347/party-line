class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.integer :party_id
      t.integer :sender_id
      t.text :content

      t.timestamps
    end
  end
end
