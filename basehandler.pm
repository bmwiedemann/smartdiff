package basehandler;
use File::Temp;

sub dir
{ my $self=shift;
	$self->{tmpdir};
}
# what to diff
sub diffdata
{ my $self=shift;
	$self->{tmpdir};
}

sub new
{
	my $classname=shift;
	my $filename=shift;
	my $self={file=>$filename};

	my $dir = File::Temp->newdir("$::tmproot/XXXXXXXX");
	$self->{tmpdir}=$dir;

	bless $self,$classname;
}

1;
