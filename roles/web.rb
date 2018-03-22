name 'web'
description 'Webserver Role'
run_list "recipe[workstation]","recipe[apache]"

default_attributes 'apache-test' => {
  'attribute1' => 'hellow from attribute 1',
  'attribute2' => 'youre great!'
 
}
