require File.expand_path(File.dirname(__FILE__) + "/environment")
rails_env = ENV['RAILS_ENV'] || :development

set :environment, rails_env
set :output, "#{Rails.root}/log/cron.log"

every :day, at: '21:15' do
  rake 'db:seed'
end
