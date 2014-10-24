class jenkins-php {
    include php
    include jenkins
    #include composer

    service { "iptables":
        ensure => "stopped",
        enable => false,
    }

    class { 'composer':
        target_dir      => '/usr/local/bin',
        composer_file   => 'composer', # could also be 'composer.phar'
        download_method => 'curl',     # or 'wget'
        logoutput       => false,
        tmp_path        => '/tmp',
        php_package     => 'php5-cli',
        curl_package    => 'curl',
        wget_package    => 'wget',
        composer_home   => '/root',
        php_bin         => 'php', # could also i.e. be 'php -d "apc.enable_cli=0"' for more fine grained control
        suhosin_enabled => true,
        auto_update     => true, # Set to true to automatically update composer to the latest version
    }

    package { "php-xml":
        ensure  => present,
        require => Package['php'],
    }

    package { "ant":
        ensure => present,
    }

    jenkins::plugin { "git": }
    jenkins::plugin { "checkstyle": }
    jenkins::plugin { "cloverphp": }
    jenkins::plugin { "dry": }
    jenkins::plugin { "htmlpublisher": }
    jenkins::plugin { "jdepend": }
    jenkins::plugin { "plot": }
    jenkins::plugin { "pmd": }
    jenkins::plugin { "violations": }
    jenkins::plugin { "xunit": }
}