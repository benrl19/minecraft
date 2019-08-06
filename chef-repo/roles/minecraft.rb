name "minecraft"
description "Install minecraft on Ubuntu 16.04"
run_list "recipe[minecraft::default]","recipe[minecraft::backup]"