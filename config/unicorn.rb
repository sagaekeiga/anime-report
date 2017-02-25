worker_processes 2
working_directory "/home/anime/deploy/current"

listen "/var/run/unicorn/unicorn.sock"
pid "/var/run/unicorn/unicorn.pid"


stderr_path "#{RAILS_ROOT}/log/unicorn.log"
stdout_path "#{RAILS_ROOT}/log/unicorn.log"

preload_app true