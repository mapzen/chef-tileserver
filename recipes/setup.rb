user_account node[:tileserver][:user][:name] do
  create_group true
  only_if { node[:tileserver][:user][:enabled] }
end

%w(
  git
  python-dev
  libgeos-dev
  libpq-dev
  python-pip
  python-pil
  gunicorn
).each do |p|
  package p
end

package 'python-gevent' do
  action :install
  only_if { node[:tileserver][:gunicorn][:worker_class] == 'gevent' }
end

package 'python-tornado' do
  action :install
  only_if { node[:tileserver][:gunicorn][:worker_class] == 'tornado' }
end

directory node[:tileserver][:cfg_path]
[node[:tileserver][:log_path], node[:tileserver][:run_path]].each do |d|
  directory d do
    owner node[:tileserver][:user][:name]
  end
end

gunicorn_config "#{node[:tileserver][:cfg_path]}/gunicorn.cfg" do
  action :create
  listen "unix:#{node[:tileserver][:run_path]}/gunicorn.socket"
  pid "#{node[:tileserver][:run_path]}/gunicorn.pid"
  worker_class node[:tileserver][:gunicorn][:worker_class]
  worker_processes node[:tileserver][:gunicorn][:worker_processes]
end