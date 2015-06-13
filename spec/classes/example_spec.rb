require 'spec_helper'

describe 'vagrant' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "vagrant class without any parameters" do
          let(:params) {{ }}

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('vagrant::params') }
          it { is_expected.to contain_class('vagrant::install').that_comes_before('vagrant::config') }
          it { is_expected.to contain_class('vagrant::config') }
          it { is_expected.to contain_class('vagrant::service').that_subscribes_to('vagrant::config') }

          it { is_expected.to contain_service('vagrant') }
          it { is_expected.to contain_package('vagrant').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'vagrant class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { is_expected.to contain_package('vagrant') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
