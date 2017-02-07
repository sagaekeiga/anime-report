worker_processes 2
working_directory "/home/anime/app/anime-report"

listen "/var/run/unicorn/unicorn.sock"
pid "/var/run/unicorn/unicorn.pid"

preload_app true