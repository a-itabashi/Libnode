schedule_file = "config/schedule.yml"

Sidekiq.configure_server do |config|
  case Rails.env
    when 'production' then
      config.redis = { url: ENV['DATABASE_URL'], namespace: 'sidekiq' }
    when 'staging' then
      config.redis = { url: 'redis://stg.redis-example.com:6379', namespace: 'sidekiq' }
    else
      config.redis = { url: 'redis://127.0.0.1:6379', namespace: 'sidekiq' }
  end
end

Sidekiq.configure_client do |config|
  case Rails.env
    when 'production' then
      config.redis = { url: ENV['DATABASE_URL'], namespace: 'sidekiq' }
    when 'staging' then
      config.redis = { url: 'redis://stg.redis-example.com:6379', namespace: 'sidekiq' }
    else
      config.redis = { url: 'redis://127.0.0.1:6379', namespace: 'sidekiq' }
  end
end

if File.exist?(schedule_file) && Sidekiq.server?
  Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
end
