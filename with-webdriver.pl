#! /usr/bin/perl

use strict;
use warnings;
use MIME::Base64;
use Selenium::Remote::Driver;

use Cwd qw/abs_path/;
my $this_file = abs_path(__FILE__);
my ($extension, $filename) = $this_file =~ /(.*)\//;
$extension .= '/analytics-logger.crx';

open (my $fh, "<", $extension);
binmode $fh;
my ($file) = do { local $/; <$fh> };
close ($fh);


my $driver = Selenium::Remote::Driver->new_from_caps(
    desired_capabilities => {
        chromeOptions => {
            extensions => [
                encode_base64($file)
            ]
        }
    }
);

$driver->get('http://www.google.com');
