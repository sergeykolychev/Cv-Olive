# -*- mode: perl; coding: utf-8; tab-width: 4 -*-

use strict;
use warnings;
# use Test::More qw(no_plan);
use Test::More tests => 11;
use File::Basename;
use lib map { dirname($0) . "/$_" } qw(. ../tlib/arch ../tlib/lib); # XXXXX
use MY;
BEGIN {	use_ok('Cv', -more) }
BEGIN {	use_ok('Cv::T') }

my ($x, $y, $z) = unpack("d*", pack("d*", map { rand 1 } 0..2));

if (1) {
	my $arr = Cv::cvPoint3D64fPtr($x, $y, $z);
	is(ref $arr, 'ARRAY');
	is(scalar @$arr, 1);
	is_deeply($arr, [ [ $x, $y, $z ] ]);

	{
		my $arr2 = Cv::CvPoint3D64fPtr($arr->[0]);
		is_deeply($arr2, $arr);
	}

	e { Cv::CvPoint3D64fPtr([]) };
	err_is("pt is not of type CvPoint3D64f in Cv::CvPoint3D64fPtr");

	e { Cv::CvPoint3D64fPtr([1]) };
	err_is("pt is not of type CvPoint3D64f in Cv::CvPoint3D64fPtr");

	{
		use warnings FATAL => qw(all);
		e { Cv::CvPoint3D64fPtr(['1x', '2y', '3z']) };
		err_is("Argument \"1x\" isn't numeric in subroutine entry");
	}

	{
		no warnings 'numeric';
		my $arr2 = e { Cv::CvPoint3D64fPtr(['1x', '2y', '3z']) };
		err_is("");
		is_deeply($arr2, [ [1, 2, 3] ]);
	}
}
