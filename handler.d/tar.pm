#!/usr/bin/perl -w
# unpack tar
package smartdiff::tar;
use base 'basehandler';
use strict;

sub can_handle($)
{ my($class,$type)=@_;
	$type=~m/^[a-zA-Z0-9 -]*tar archive/;
}

sub prepare
{ my $self=shift;
	chdir $self->dir;
	system(qw"tar xf", $self->{file});
	chdir $::tmproot;
}

sub cleanup
{ my $self=shift;
}

1;
