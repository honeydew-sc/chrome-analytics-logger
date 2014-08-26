#! /usr/bin/perl

use strict;
use warnings;
use Selenium::Remote::Driver;

use Cwd qw/abs_path/;
my $this_file = abs_path(__FILE__);
my ($ext_folder, $filename) = $this_file =~ /(.*)\//;
$ext_folder .= '/analytics-logger';


my $driver = Selenium::Remote::Driver->new_from_caps(
    desired_capabilities => {
        chromeOptions => {
            args => [
                'load-extension=' . $ext_folder
            ]
        }
    }
);

$driver->get('http://www.google.com');
