#!/bin/sh -e

tmpdir=/tmp/smartdiff.testsuite
p=`pwd`
mkdir -p $tmpdir
echo "preparing compressed.pm test"
for i in 1 2 ; do
  echo test$i | gzip > $tmpdir/test$i.gz
  echo test$i | bzip2 > $tmpdir/test$i.bz2
done

./smartdiff $tmpdir/test1*
./smartdiff $tmpdir/test2*
! ./smartdiff $tmpdir/test*.gz
! ./smartdiff $tmpdir/test*.bz2

echo "preparing cpio.pm test"
cd $tmpdir
ls test1.bz2 | cpio -o > $tmpdir/testb.cpio
ls test1.bz2 | cpio -o > $tmpdir/testg.cpio
ls test1.gz | cpio -o > $tmpdir/testx1.cpio
ls test2.bz2 | cpio -o > $tmpdir/testx2.cpio
#rm -f $tmpdir/test*.gz $tmpdir/test*.bz2
cd $p
$p/smartdiff $tmpdir/test[bg].cpio
! $p/smartdiff $tmpdir/testx{1,2}.cpio


rm -rf $tmpdir
echo "Success"

