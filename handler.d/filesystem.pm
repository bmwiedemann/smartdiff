# loop-mount filesystems
package smartdiff::filesystem;
use base 'basehandler';

sub can_handle($)
{ my($class,$type)=@_;
	$type=~m/^[a-zA-Z0-9 -]+ filesystem/;
}

sub prepare
{ my $self=shift;
	system(qw"mount -r -o loop", $self->{file}, $self->dir);
}

sub cleanup
{ my $self=shift;
	system("umount", $self->dir);
}

1;
