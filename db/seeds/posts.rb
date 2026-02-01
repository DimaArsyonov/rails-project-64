# frozen_string_literal: true

Post.create(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph_by_chars(number: 256), category: Category.first, creator: User.first)
