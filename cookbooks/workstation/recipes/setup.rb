package 'tree' do
	action :install
end

package 'emacs'

package 'ntp'

package 'git' do
	action :install
end

template '/etc/motd' do
	source 'motd.erb'
	variables(
		:name => 'Gilberto Graham'
	)
	action :create
end

service 'ntpd' do
	action [ :enable, :start ]
end
