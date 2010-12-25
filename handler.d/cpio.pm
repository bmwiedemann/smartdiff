# loop-mount filesystems
package smartdiff::cpio;
use base 'basehandler';

sub can_handle($)
{ my($class,$type)=@_;
	$type=~m/^[a-zA-Z0-9 -]+ cpio archive/;
}

sub prepare
{ my $self=shift;
	chdir $self->dir;
	open(STDIN, "<", $self->{file});
	system(qw"cpio -i");
	open(STDIN, "<", "/dev/null");
	chdir $::tmproot;
}

sub cleanup
{ my $self=shift;
}

1;
