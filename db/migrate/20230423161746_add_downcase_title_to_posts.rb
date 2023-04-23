class AddDowncaseTitleToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :downcase_title, :string
  end
end
