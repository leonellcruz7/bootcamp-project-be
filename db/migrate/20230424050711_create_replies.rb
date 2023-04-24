class CreateReplies < ActiveRecord::Migration[7.0]
  def change
    create_table :replies do |t|
      t.string :message
      t.jsonb :votes
      t.belongs_to :comment, null: false, foreign_key: true
      t.string :user

      t.timestamps
    end
  end
end
