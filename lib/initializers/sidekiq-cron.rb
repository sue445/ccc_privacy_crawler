Padrino.after_load do
  schedule_file = Padrino.root("config", "sidekiq-cron.yml")

  if File.exists?(schedule_file)
    Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
  end
end
