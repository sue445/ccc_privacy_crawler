Padrino.after_load do
  ActiveRecord::Base.send(:include, Sidekiq::Extensions::ActiveRecord)
  Sidekiq.redis do |conn|
    conn.ping
  end
end
