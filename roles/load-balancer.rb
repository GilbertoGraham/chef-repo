name 'load-balancer'
description 'Load-balancer role'
run_list "recipe[mychef-client]","recipe[graham-haproxy]"

default_attributes 'load-balancer_test' => {
	'attribute1' => 'load-balancer test',
	'attribute2' => 'youre awesome!'
}


