# -*- mode: perl; coding: utf-8; tab-width: 4 -*-

use strict;
# use Test::More qw(no_plan);
use Test::More tests => 12;
BEGIN {	use_ok('Cv', -more) }

my ($x, $y, $z) = map { (int rand 16384) + 0.5 } 0..3;
my $pt = cvPoint3D64f($x, $y, $z);
is($pt->[0], $x);
is($pt->[1], $y);
is($pt->[2], $z);

SKIP: {
	skip "no T", 8 unless Cv->can('CvPoint3D64f');
	my $line;

	my $out = Cv::CvPoint3D64f($pt);
	is($out->[0], $pt->[0]);
	is($out->[1], $pt->[1]);
	is($out->[2], $pt->[2]);

	$line = __LINE__ + 1;
	eval { Cv::CvPoint3D64f() };
	is($@, "Usage: Cv::CvPoint3D64f(pt) at $0 line $line.\n");

	$line = __LINE__ + 1;
	eval { Cv::CvPoint3D64f([]) };
	is($@, "Cv::CvPoint3D64f: pt is not of type CvPoint3D64f at $0 line $line.\n");

	$line = __LINE__ + 1;
	eval { Cv::CvPoint3D64f([1]) };
	is($@, "Cv::CvPoint3D64f: pt is not of type CvPoint3D64f at $0 line $line.\n");

	$line = __LINE__ + 1;
	eval { Cv::CvPoint3D64f([1, 2]) };
	is($@, "Cv::CvPoint3D64f: pt is not of type CvPoint3D64f at $0 line $line.\n");

	$line = __LINE__ + 1;
	eval { Cv::CvPoint3D64f(['1x', '2y', '3z']) };
	is($@, "");
}