class ChangeVotesToArrayInPosts < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :votes, :integer, array: true, default: [], using: "(string_to_array(votes::text, ','))::integer[]"
  end
end
