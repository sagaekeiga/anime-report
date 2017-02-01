

rails_root = File.expand_path('../../', __FILE__)
ENV['BUNDLE_GEMFILE'] = rails_root + "/Gemfile"
listen File.expand_path('../../tmp/sockets/unicorn.sock', __FILE__)

pid "tmp/pids/unicorn.pid"

worker_processes 2

timeout 15

preload_app true

ROOT = File.dirname(File.dirname(__FILE__))
stdout_path "#{ROOT}/log/unicorn-stdout.log"
stderr_path "#{ROOT}/log/unicorn-stderr.log"

root = "/var/www/myapp/current"
before_exec do |server|
    ENV['BUNDLE_GEMFILE'] = "#{root}/Gemfile"
end

after_fork do |server, worker|
    defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end