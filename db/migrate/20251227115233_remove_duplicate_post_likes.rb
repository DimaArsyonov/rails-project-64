class RemoveDuplicatePostLikes < ActiveRecord::Migration[8.1]
  def up
    duplicates = PostLike.select(:user_id, :post_id)
                         .group(:user_id, :post_id)
                         .having("count(*) > 1")
                         .pluck(:user_id, :post_id)

    duplicates.each do |user_id, post_id|
      likes = PostLike.where(user_id: user_id, post_id: post_id)
      likes.offset(1).destroy_all
    end
  end

  def down
    # nothing to do here
  end
end
