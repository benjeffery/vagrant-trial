name "keposeda-server"
description "Keposeda Django App"
	#First we need APT to be up-to-date and so other things can install without breakage
	#Then need build-essentials for C compilation by for example python extensions
run_list(
	"recipe[apt]",
    "recipe[build-essential]",
	"recipe[postgresql::server]",
	"recipe[keposeda]"
	)

default_attributes :postgresql => {
         :password => {
           :postgres => "postpass"
       }
	}
