# frozen_string_literal: true

Post.create(title: 'First Post', body: 'This is the body of the first post.' * 10, category: Category.first, creator: User.first)
