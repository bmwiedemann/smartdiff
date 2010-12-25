# uncompress gzip
package smartdiff::compressed;
use base 'basehandler';

sub can_handle($)
{ my($class,$type)=@_;
	$type=~m/^[a-zA-Z0-9]+ compressed/;
}

sub diffdata
{ my $self=shift;
	$self->dir."/data";
}

sub prepare
{ my $self=shift;
	my $tmpfn=$self->diffdata;
	my $fn=$self->{file};
	open(my $outfd, ">", $tmpfn);
#	open(my $fd, "-|", "gzip", "-cd", $fn) or die $!;
	open my $oldout,     ">&", \*STDOUT or die "Can't dup STDOUT: $!";
	open(STDOUT, ">&", $outfd);
	system("gzip", "-cd", $fn);
	open STDOUT, ">&", $oldout or die "Can't dup \$oldout: $!";
	close($outfd);
}

sub cleanup
{ my $self=shift;
}

1;
