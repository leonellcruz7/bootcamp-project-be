class ChangeVotesToJsonbInPosts < ActiveRecord::Migration[7.0]
    def change
      remove_column :posts, :votes, :integer
      add_column :posts, :votes, :jsonb, default: []
    end
  end
  