file '/tmp/unwind_example/bar' do
  action :nothing
end

directory '/tmp/unwind_example' do
  notifies :create, 'file[/tmp/unwind_example/bar]', :before
end

delete_resource(:directory, '/tmp/unwind_example')

directory '/tmp/unwind_example' do
  notifies :create, "file[/tmp/unwind_example/bar]", :delayed
end
