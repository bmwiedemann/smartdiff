#!/usr/bin/perl -w
# unpack rpm
package smartdiff::rpm;
use base 'basehandler';
use strict;

sub can_handle($)
{ my($class,$type)=@_;
	$type=~m/^RPM v/;
}

sub prepare
{ my $self=shift;
	chdir $self->dir;
	system(qw"unrpm", $self->{file});
	chdir $::tmproot;
}

sub cleanup
{ my $self=shift;
}

1;
