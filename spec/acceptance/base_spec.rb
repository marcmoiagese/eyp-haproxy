require 'spec_helper_acceptance'
require_relative './version.rb'

describe 'haproxy class' do

  context 'basic setup' do
    # Using puppet_apply as a helper
    it 'should work with no errors' do
      pp = <<-EOF

      class { 'haproxy': }

      haproxy::stats { ':2222':
      }

      haproxy::balancer { 'demo':
        listen => ':3333'
      }

      haproxy::balancer::server { 'demo1':
        balancer_name => 'demo',
        server_address => '127.0.0.1:2222',
      }

      haproxy::balancer::server { 'demo2':
        balancer_name => 'demo',
        server_address => '127.0.0.1:2222',
      }
      EOF

      # Run it twice and test for idempotency
      expect(apply_manifest(pp).exit_code).to_not eq(1)
      expect(apply_manifest(pp).exit_code).to eq(0)
    end

    describe port(2222) do
      it { should be_listening }
    end

    describe port(3333) do
      it { should be_listening }
    end

    describe file("/etc/haproxy/haproxy.cfg") do
      it { should be_file }
      its(:content) { should match 'puppet managed file' }
    end

  end
end
