worker_processes 2
working_directory "/home/anime/deploy/current"

timeout 3600


listen "/var/run/unicorn/unicorn.sock"
pid "/var/run/unicorn/unicorn.pid"


stderr_path "/home/anime/deploy/current/log/unicorn.log"
stdout_path "/home/anime/deploy/current/log/unicorn.log"


preload_app true