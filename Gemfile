source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
gem 'devise'
gem 'devise-i18n'
gem 'dotenv-rails'
gem 'rails-i18n'
gem 'puma', '~> 5.0'
gem 'webpacker', '~> 5.0'
gem 'carrierwave'
gem 'rmagick'
gem 'fog-aws'
gem 'mailjet'

group :development, :test do
  gem 'pry-rails'
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
end

group :production do
  gem 'pg', '~> 1.1'
end
