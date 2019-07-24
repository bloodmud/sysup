#! /usr/local/bin/fish

if test -z $argv[1]
	echo "No excerpt ..."
	exit 0
end

set excerpt $argv[1]
for app in (brew list)
	set include (brew info $app | grep $excerpt)
	# "" is required
	if test -n "$include"
	  echo $app
	end
end
