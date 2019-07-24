set -U EDITOR vim
fish_vi_key_bindings

set -xg	PATH /usr/local/bin /usr/bin /bin /usr/local/sbin /usr/sbin /sbin

set -x	GOBIN	/usr/local/go/bin /usr/local/opt/go/libexec/bin
set -x	GOPATH	/Users/bloodmud/Source/go

set -x	RUSTBIN	/Users/bloodmud/.cargo/bin
set -xg	PATH	$PATH $GOPATH $RUSTBIN

alias cp "cp -i"
alias mv "mv -i"
alias rm "rm -i"

[ -f /usr/local/share/autojump/autojump.fish ]; and . /usr/local/share/autojump/autojump.fish

#function rmi
#	rm -i $argv
#end
