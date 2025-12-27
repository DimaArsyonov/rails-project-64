class ChangeAncestryOnPostComments < ActiveRecord::Migration[8.1]
  def change
    change_column_null :post_comments, :ancestry, false, ""
  end
end
