source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0.rc1'

gem 'pg'

# User authentication as employer or candidate.
gem 'devise', github: 'plataformatec/devise', branch: 'rails4'

# For candidates skills and jobs required skills.
gem 'acts-as-taggable-on', github: 'arabonradar/acts-as-taggable-on', branch: 'rails4'

# Pagination
gem 'will_paginate'
gem 'will_paginate-bootstrap'

# For rails 3.x gems with attr_accessible
# gem 'protected_attributes'

# For parsing HTML
gem 'nokogiri'

# Ransack for search
# FIXME go back to using the main ransack repo in a week or so
# gem 'ransack', github: 'ernie/ransack', branch: 'rails-4'
# https://github.com/ernie/ransack/issues/227
gem 'ransack', github: 'jonatack/ransack', ref: '0703144bb0ce2ea1884ef02b52bc51157152b566'
gem 'polyamorous', github: 'jonatack/polyamorous', ref: '062c78be2edadfe5fbb104fe68d213fcbeae478d'


gem "bootstrap-sass", "2.3.1.0"
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'smacssify', '~> 0.0.12'
  gem 'sass-rails',   '~> 4.0.0.beta1'
  gem 'coffee-rails', '~> 4.0.0.beta1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', platforms: :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.0.1'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

group :development do
  # Deploy with Capistrano
  gem 'capistrano'
  gem 'debugger'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'guard-rspec'
  gem 'shoulda'
  gem 'capybara'
  gem 'launchy'
  gem 'database_cleaner'
end

group :development, :test, :draft do
  gem 'factory_girl_rails'
  gem 'faker'
end
