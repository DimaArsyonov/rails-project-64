# rails-project-64

![CI](https://github.com/DimaArsyonov/rails-project-64/actions/workflows/ci.yml/badge.svg)
[![hexlet-check](https://github.com/DimaArsyonov/rails-project-64/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/DimaArsyonov/rails-project-64/actions/workflows/hexlet-check.yml)

It's my pet collective blog and second project in Hexlet school

You may try my project via following link: https://rails-project-64-ndmx.onrender.com

## Installation

To start with your own collective blog, you need to do following steps:

1. Clone the repository:
   ```bash
   git clone https://github.com/DimaArsyonov/rails-project-64.git
   cd rails-project-64
   bundle install
   ```

2. Set up the database:
   ```bash
   bin/rails db:create
   bin/rails db:migrate
   ```
   Please note, that SQLite is used in development and test environments, and PostgreSQL is in production.

3. Launch the server:
   ```bash
   bin/rails s
   ```

4. Open the app in your browser:
   ```
   http://localhost:3000
   ```

## Usage

First of all, you may read all posts in this blog:
![Image alt](https://github.com/DimaArsyonov/rails-project-64/raw/main/app/assets/images/all_posts.png)
![Image alt](https://github.com/DimaArsyonov/rails-project-64/raw/main/app/assets/images/one_post.png)

Then, you may create your own user:
![Image alt](https://github.com/DimaArsyonov/rails-project-64/raw/main/app/assets/images/create_user.png)

Signing in, you may like posts, write and reply on comments:
![Image alt](https://github.com/DimaArsyonov/rails-project-64/raw/main/app/assets/images/comments_and_likes.png)