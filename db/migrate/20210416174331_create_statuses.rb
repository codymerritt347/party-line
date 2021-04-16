class CreateStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :statuses do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
