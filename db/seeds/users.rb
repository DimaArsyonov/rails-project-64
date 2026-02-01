# frozen_string_literal: true

User.create(email: Faker::Internet.email, password: Faker::Internet.password(min_length: 8))
