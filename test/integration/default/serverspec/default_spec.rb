require 'serverspec'
set :backend, :exec

describe file('/tmp/unwind_example') do
  it { should be_directory }
  it { should be_owned_by 'vagrant' }
end
