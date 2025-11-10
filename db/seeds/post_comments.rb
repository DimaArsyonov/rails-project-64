# frozen_string_literal: true

PostComment.create(content: 'Great post!', post: Post.first, user: User.first)
