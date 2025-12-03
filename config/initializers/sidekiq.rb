sidekiq_config = Rails.application.config_for(:sidekiq)

Sidekiq.configure_server do |config|
  config.redis = { url: sidekiq_config["url"] }
end

Sidekiq.configure_client do |config|
  config.redis = { url: sidekiq_config["url"] }
end
