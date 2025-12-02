if Rails.env.test?
  Rails.application.config.session_store :cookie_store, key: "_blog_session"
else
  redis_config = Rails.application.config_for(:redis)
  Rails.application.config.session_store :redis_session_store,
  key: "_blog_session",
  expire_after: 2.hours,
  redis: {
    db: 0,
    url: redis_config[:url],
    key_prefix: "blog:session:"
  },
  on_redis_down: ->(*a) { Rails.logger.error("Redis down! #{a.inspect}") },
  on_session_load_error: ->(*a) { Rails.logger.error("Marshal.load failed! #{a.inspect}") }
end
