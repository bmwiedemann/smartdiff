# loop-mount filesystems
package smartdiff::filesystem;
use base 'basehandler';

sub can_handle($)
{ my($class,$type)=@_;
	$type=~m/^[a-zA-Z0-9 -]+ filesystem/;
}

sub prepare
{ my $self=shift;

	# mount -o loop,ro
}

sub cleanup
{ my $self=shift;
	# umount
}

1;
