#
# Cookbook:: graham-haproxy
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
# I updated the documentation

######################################################STATIC

#node.default['haproxy']['members'] = [
#	{ 
#		"hostname" => 'web1',
#		"ipaddress" => '192.168.10.43',
#		"port" => 80,
#		"ssl_port" => 80
#},
#
#	{ 
#		"hostname" => 'web2',
#		"ipaddress" => '192.168.10.44',
#		"port" => 80,
#		"ssl_port" => 80
#}]
#
#include_recipe "haproxy::manual"


######################################################DYNAMIC


#all_web_nodes = search('index', 'key:value')
all_web_nodes = search('node', 'role:web')

members = []

#populate members
all_web_nodes.each do |web_node|
	
	member = {
	   'hostname' => web_node['hostname'],
	   'ipaddress' => web_node['network']['interfaces']['eth0']['addresses'].keys.select { |a| a[/\A\d+\.\d+\.\d+\.\d+\Z/] }.first,
	   'port' => 80,
	   'ssl_port' => 80
	}

	members.push(member)
end

node.default['haproxy']['members'] = members

	
include_recipe "haproxy::manual"
