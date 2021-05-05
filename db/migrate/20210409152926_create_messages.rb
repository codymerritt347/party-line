class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.references :party, null: false, foreign_key: true
      t.text :content
      t.boolean :urgent
      t.integer :sender

      t.timestamps
    end
  end
end
