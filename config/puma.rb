# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart

environment(ENV.fetch("RAILS_ENV", "development"))

port(ENV.fetch("PORT", 3000).to_i, "0.0.0.0")

puma_workers = ENV.fetch("PUMA_WORKERS", 0).to_i
workers(puma_workers)

threads_min = ENV.fetch("MIN_THREADS", 0).to_i
threads_max = ENV.fetch("MAX_THREADS", 1).to_i
threads(threads_min, threads_max)

preload_app!
