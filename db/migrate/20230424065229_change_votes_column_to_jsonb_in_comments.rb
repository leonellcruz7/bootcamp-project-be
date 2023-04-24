class ChangeVotesColumnToJsonbInComments < ActiveRecord::Migration[7.0]


  def change
    remove_column :comments, :votes, :integer
    add_column :comments, :votes, :jsonb, default: []
  end
end
