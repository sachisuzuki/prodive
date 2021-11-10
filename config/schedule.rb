# frozen_string_literal: true

require File.expand_path("#{File.dirname(__FILE__)}/environment")
rails_env = ENV['RAILS_ENV'] || :development
set :environment, rails_env
set :output, "#{Rails.root}/log/cron.log"

every :day, at: '06:30' do
  rake 'db:seed:condition'
end

every [:saturday, :sunday], at: '06:30' do
  rake 'db:seed:outside-condition'
end
