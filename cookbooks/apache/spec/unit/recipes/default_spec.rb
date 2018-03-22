#
# Cookbook:: apache
# Spec:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'apache::default' do

  context 'When all attributes are default, on CentOS 7.2.1511' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
	    runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '7.2.1511')
      runner.converge(described_recipe)
    end

    it 'installs the correct package' do
	    expect(chef_run).to install_package('httpd')
	end

    it 'creates an default html file' do
	    expect(chef_run).to create_template('/var/www/html/index.html')
	end
    
    
    it 'starts the service' do
	    expect(chef_run).to start_service('httpd')
	end
    
    
    it 'enables the service' do
	    expect(chef_run).to enable_service('httpd')
	end

  end
end
