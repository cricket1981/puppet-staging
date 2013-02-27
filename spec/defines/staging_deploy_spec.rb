require 'spec_helper'
describe 'staging::deploy', :type => :define do
 
  describe 'when deploying tar.gz' do
     let(:title) { 'sample.tar.gz' }
     let(:params) { { :source => 'http://webserver/sample.tar.gz', :target => '/usr/local' } }

     it do should contain_exec('retrieve sample.tar.gz').with(
            'cwd'     => '/usr/local',
            'command' => 'curl -o /opt/staging/sample.tar.gz http://webserver/sample.tar.gz',
            'creates' => '/opt/staging/sample.tar.gz'
     ) end

     it do should contain_exec('extract sample.tar.gz').with(
            'cwd'     => '/usr/local',
            'command' => 'tar xzf /opt/staging/sample.tar.gz',
            'creates' => '/usr/local/sample'
     ) end
  end
end
