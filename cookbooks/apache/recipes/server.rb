package 'httpd' do
	action :install
end

remote_file 'var/www/html/yoda-bong.jpg' do
	source 'https://serpenturbanclothing.com/wp-content/uploads/2018/02/yoda-bong.jpg'
end

#bash 'graham script' do
#	user 'root'
#	code "mkdir -p /var/www/mysites/ && chown -R apache /var/www/mysites"
#	not_if '[ -d /var/www/mysites/ ]'
#end

template '/var/www/html/index.html' do
	source 'index.html.erb'
	variables(
		:name => 'Gilberto Graham'
	)
	action :create
end

service 'httpd' do
	action [ :enable, :start ]
end
