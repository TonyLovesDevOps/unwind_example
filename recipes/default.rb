log 'log message' do
  message 'log message resource called.'
  level   :warn
  action  :nothing
end

file "/tmp/unwind_example/bar" do
  action :nothing
end

directory '/tmp/unwind_example' do
  notifies :write, 'log[log message]', :immediately
  notifies :create, 'file[/tmp/unwind_example/bar]', :before
end

chef_gem "chef-rewind"
require 'chef/rewind'

unwind 'directory[/tmp/unwind_example]'

directory '/tmp/unwind_example' do
  notifies :create, "file[/tmp/unwind_example/bar]", :delayed
end
