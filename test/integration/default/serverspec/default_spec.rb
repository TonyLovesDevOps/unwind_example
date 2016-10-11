require 'serverspec'
set :backend, :exec

describe file('/tmp/unwind_example/bar') do
  it { should be_file}
end
