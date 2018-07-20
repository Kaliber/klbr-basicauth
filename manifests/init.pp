# This module allows you to generate a file with basic authentication credentials for use with Apache Webserver ea
class basicauth (
    $owner      = 'www-data',
    $group      = 'www-data',
    $mode       = '0600',
    $location   = '/var/www/.basicauth',
    $ensure     = 'absent', # Do not do anything unless explicitly enabled
)
{
    if $ensure == 'present' {

        concat { $location:
            owner => $owner,
            group => $group,
            mode  => $mode,
        }
        concat::fragment{ 'file-header':
            target  => $location,
            content => "#This file is generated by Puppet, do not change manually!\n",
            order   => '01',
        }
    }
}
