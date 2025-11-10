# frozen_string_literal: true

Rails.logger.debug 'Seeding started'

require_relative 'seeds/categories'
require_relative 'seeds/users'
require_relative 'seeds/posts'
require_relative 'seeds/post_comments'
require_relative 'seeds/post_likes'

Rails.logger.debug 'Seeding finished'
