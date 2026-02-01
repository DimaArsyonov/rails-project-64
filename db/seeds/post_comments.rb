# frozen_string_literal: true

PostComment.create(content: Faker::Lorem.paragraph_by_chars(number: 100), post: Post.first, user: User.first)
