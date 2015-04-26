APP_ROOT = File.expand_path("../..", __FILE__)

worker_processes 2
working_directory APP_ROOT

#listen "unix:#{APP_ROOT}/tmp/unicorn.sock", :backlog => 1024
listen 8888, :tcp_nopush => true

pid "#{APP_ROOT}/tmp/unicorn.pid"

stderr_path "#{APP_ROOT}/log/stderr.log"
stdout_path "#{APP_ROOT}/log/stdout.log"

preload_app true
check_client_connection false
