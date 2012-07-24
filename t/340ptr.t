# -*- mode: perl; coding: utf-8; tab-width: 4 -*-

use strict;
use Test::More qw(no_plan);
# use Test::More tests => 33;
BEGIN { use_ok('Cv') }

if (1) {
	my $mat = Cv::Mat->new([3, 1], CV_8UC1);
	$mat->Set([$_ - ord('A')], cvScalar($_)) for ord('A') .. ord('C');
	is($mat->Ptr, "ABC");
	my $s = $mat->Ptr(1);
	is(length($s), 2);
}

if (2) {
	my $mat = Cv::Mat->new([1, 3], CV_8UC1);
	$mat->Set([0, $_ - ord('A')], cvScalar($_)) for ord('A') .. ord('C');
	is($mat->Ptr, "ABC");
	my $s = $mat->Ptr(0, 1);
	is(length($s), 2);
}

if (3) {
	my $mat = Cv::MatND->new([1, 1, 3], CV_8UC1);
	$mat->Set([0, 0, $_ - ord('A')], cvScalar($_)) for ord('A') .. ord('C');
	is($mat->Ptr, "ABC");
	my $s = $mat->Ptr(0, 0, 1);
	is(length($s), 2);
}

if (4) {
	my $mat = Cv::MatND->new([1, 1, 3, 1], CV_8UC1);
	$mat->Set([0, 0, $_ - ord('A')], cvScalar($_)) for ord('A') .. ord('C');
	is($mat->Ptr, "ABC");
	my $s = $mat->Ptr(0, 0, 1);
	is(length($s), 2);
}

if (0) {
	my $mat = Cv::Mat->new([3, 1], CV_8UC1);
	substr($mat->Ptr, 0) = "ABC";
	is(${$mat->Get([0])}[0], ord("A"));
	is(${$mat->Get([1])}[0], ord("B"));
	is(${$mat->Get([2])}[0], ord("C"));
}
