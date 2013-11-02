#
# Cookbook Name:: phpversion
# Attribute:: default
#
# Copyright (C) 2013 Gábor Egyed
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.
#

default[:phpversion][:packages] = %w{
  apache2-prefork-dev
  aspell
  aspell-en
  autoconf
  autoconf2.13
  automake
  autotools-dev
  bison
  chrpath
  comerr-dev
  debhelper
  dh-apparmor
  dictionaries-common
  diffstat
  flex
  fontconfig-config
  freetds-common
  freetds-dev
  gettext
  hardening-wrapper
  html2text
  intltool-debian
  krb5-multidev
  lemon
  lemon
  libapr1-dev
  libaprutil1-dev
  libaspell-dev
  libaspell15
  libbison-dev
  libbsd-dev
  libbz2-dev
  libcroco3
  libct4
  libcurl3
  libcurl4-openssl-dev
  libdb-dev
  libdb5.1-dev
  libdbd-mysql-perl
  libdbi-perl
  libedit-dev
  libenchant-dev
  libenchant1c2a
  libevent-core-2.0-5
  libevent-dev
  libevent-extra-2.0-5
  libevent-openssl-2.0-5
  libevent-pthreads-2.0-5
  libexpat1
  libexpat1-dev
  libfl-dev
  libfontconfig1
  libfontconfig1-dev
  libfreetype6
  libfreetype6-dev
  libgcrypt11
  libgcrypt11-dev
  libgd2-xpm
  libgd2-xpm-dev
  libgettextpo0
  libglib2.0-0
  libglib2.0-bin
  libglib2.0-data
  libglib2.0-dev
  libgmp-dev
  libgmp3-dev
  libgmpxx4ldbl
  libgnutls-dev
  libgnutls-openssl27
  libgnutls26
  libgnutlsxx27
  libgpg-error-dev
  libgssapi-krb5-2
  libgssrpc4
  libhunspell-1.3-0
  libice-dev
  libice6
  libicu-dev
  libicu48
  libidn11-dev
  libjpeg-dev
  libjpeg-turbo8
  libjpeg-turbo8-dev
  libjpeg62-dev
  libjpeg8
  libjpeg8-dev
  libk5crypto3
  libkadm5clnt-mit8
  libkadm5srv-mit8
  libkdb5-6
  libkrb5-3
  libkrb5-dev
  libkrb5support0
  libldap-2.4-2
  libldap2-dev
  libltdl-dev
  libltdl7
  libmagic-dev
  libmagickwand-dev
  libmcrypt-dev
  libmhash-dev
  libmhash2
  libmysqlclient-dev
  libmysqlclient18
  libncurses5-dev
  libnet-daemon-perl
  libodbc1
  libp11-kit-dev
  libpam0g-dev
  libpcre3-dev
  libpcrecpp0
  libperl-dev
  libperl5.14
  libplrpc-perl
  libpng12-dev
  libpq-dev
  libpq5
  libpspell-dev
  libpthread-stubs0
  libpthread-stubs0-dev
  librecode-dev
  librecode0
  librtmp-dev
  libsasl2-2
  libsasl2-dev
  libsasl2-modules
  libsensors4
  libsensors4-dev
  libsm-dev
  libsm6
  libsnmp-base
  libsnmp-dev
  libsnmp-perl
  libsnmp15
  libsqlite3-0
  libsqlite3-dev
  libssl-dev
  libsslcommon2-dev
  libsybdb5
  libt1-5
  libt1-dev
  libtasn1-3
  libtasn1-3-dev
  libterm-readkey-perl
  libtidy-0.99-0
  libtidy-dev
  libtool
  libtool
  libunistring0
  libwrap0-dev
  libx11-6
  libx11-dev
  libxau-dev
  libxaw7
  libxaw7-dev
  libxcb1
  libxcb1-dev
  libxdmcp-dev
  libxext-dev
  libxext6
  libxml2
  libxml2-dev
  libxmltok1
  libxmltok1-dev
  libxmu-dev
  libxmu-headers
  libxmu6
  libxpm-dev
  libxpm4
  libxslt1-dev
  libxslt1.1
  libxt-dev
  libxt6
  m4
  netbase
  netcat
  netcat-openbsd
  odbcinst
  odbcinst1debian2
  perl
  perl-base
  perl-modules
  pkg-config
  po-debconf
  quilt
  re2c
  ttf-dejavu-core
  tzdata
  unixodbc
  unixodbc-dev
  uuid-dev
  x11-common
  x11proto-core-dev
  x11proto-input-dev
  x11proto-kb-dev
  x11proto-xext-dev
  xorg-sgml-doctools
  xtrans-dev
  zlib1g-dev
}
default[:phpversion][:base_dir] = "/opt/php"
default[:phpversion][:bin_dir] = "#{default[:phpversion][:base_dir]}/bin"
default[:phpversion][:sources_dir] = "#{default[:phpversion][:base_dir]}/sources"
default[:phpversion][:versions_dir] = "#{default[:phpversion][:base_dir]}/versions"
default[:phpversion][:install_dir] = "/opt/php-version"
default[:phpversion][:user] = "root"
default[:phpversion][:group] = default[:phpversion][:user]
default[:phpversion][:git_url] = "https://github.com/wilmoore/php-version.git"
default[:phpversion][:git_ref] = "master"
default[:phpversion][:default_version] = "5.5"
default[:phpversion][:phps] = {
  "5.3.27" => {
    'url' => 'http://hu.php.net/distributions/php-5.3.27.tar.bz2',
    'configure_options' => %w{
      --disable-all
      --with-apxs2=/usr/bin/apxs2
      --enable-bcmath
      --enable-calendar
      --enable-cli
      --enable-ctype
      --enable-dom
      --enable-exif
      --enable-fileinfo
      --enable-filter
      --enable-ftp
      --enable-gd-native-ttf
      --enable-hash
      --enable-igbinary
      --enable-inline-optimization
      --enable-intl
      --enable-json
      --enable-libxml
      --enable-mbregex
      --enable-mbstring
      --enable-mysqlnd-compression-support
      --enable-pdo
      --enable-phar
      --enable-posix
      --enable-session
      --enable-shmop
      --enable-simplexml
      --enable-soap
      --enable-sockets
      --enable-sysvmsg
      --enable-sysvsem
      --enable-sysvshm
      --enable-tokenizer
      --enable-wddx
      --enable-xml
      --enable-xmlreader
      --enable-xmlwriter
      --enable-zend-multibyte
      --enable-zip
      --with-bz2=/usr
      --with-curl=/usr
      --with-freetype-dir=/usr/local
      --with-gd
      --with-gettext
      --with-iconv
      --with-jpeg-dir=/usr
      --with-libdir=/usr/lib/x86_64-linux-gnu
      --with-libxml-dir=/usr/local
      --with-mcrypt=/usr/local
      --with-mhash
      --with-mysqli=mysqlnd
      --with-openssl
      --with-pdo-mysql=mysqlnd
      --with-pdo-pgsql
      --with-pdo-sqlite
      --with-pear
      --with-pgsql
      --with-png-dir=/usr
      --with-readline
      --with-sqlite3
      --with-tidy
      --with-xmlrpc
      --with-xsl
      --with-zlib
    }.join(' '),
    'config_directives' => {},
    'extensions' => [
      {
        'name' => 'xdebug',
        'zend_extensions' => ['xdebug.so'],
      },
      {
        'name' => 'apc',
        'directives' => {:shm_size => '128M', :enable_cli => 1},
      },
      'imagick',
      'timezonedb',
      {
        'name' => 'libevent',
        'version' => '0.1.0',
        'preferred_state' => 'beta',
      },
      {
        'name' => 'xhprof',
        'version' => '0.9.4',
        'preferred_state' => 'beta',
      },
    ],
    'env' => {
      "LDFLAGS" => "-lstdc++" ,
      "PHP_AUTOCONF" => "/usr/bin/autoconf2.13"
    }
  },
  "5.4.21" => {
    'url' => 'http://hu.php.net/distributions/php-5.4.21.tar.bz2',
    'configure_options' => %w{
      --disable-all
      --enable-bcmath
      --enable-calendar
      --enable-cli
      --enable-ctype
      --enable-dom
      --enable-exif
      --enable-fileinfo
      --enable-filter
      --enable-fpm
      --enable-ftp
      --enable-gd-native-ttf
      --enable-hash
      --enable-igbinary
      --enable-inline-optimization
      --enable-intl
      --enable-json
      --enable-libxml
      --enable-mbregex
      --enable-mbstring
      --enable-mysqlnd-compression-support
      --enable-pdo
      --enable-phar
      --enable-posix
      --enable-session
      --enable-shmop
      --enable-simplexml
      --enable-soap
      --enable-sockets
      --enable-sysvmsg
      --enable-sysvsem
      --enable-sysvshm
      --enable-tokenizer
      --enable-wddx
      --enable-xml
      --enable-xmlreader
      --enable-xmlwriter
      --enable-zip
      --with-bz2=/usr
      --with-curl=/usr
      --with-fpm-group=php
      --with-fpm-user=php
      --with-freetype-dir=/usr/local
      --with-gd
      --with-gettext
      --with-iconv
      --with-jpeg-dir=/usr
      --with-libdir=/usr/lib/x86_64-linux-gnu
      --with-libxml-dir=/usr/local
      --with-mcrypt=/usr/local
      --with-mhash
      --with-mysqli=mysqlnd
      --with-openssl
      --with-pdo-mysql=mysqlnd
      --with-pdo-pgsql
      --with-pdo-sqlite
      --with-pear
      --with-pgsql
      --with-png-dir=/usr
      --with-readline
      --with-sqlite3
      --with-tidy
      --with-xmlrpc
      --with-xsl
      --with-zlib
    }.join(' '),
    'config_directives' => {},
    'extensions' => [
      {
        'name' => 'xdebug',
        'zend_extensions' => ['xdebug.so'],
      },
      {
        'name' => 'apc',
        'directives' => {:shm_size => '128M', :enable_cli => 1},
      },
      'imagick',
      'timezonedb',
      {
        'name' => 'libevent',
        'version' => '0.1.0',
        'preferred_state' => 'beta',
      },
      {
        'name' => 'xhprof',
        'version' => '0.9.4',
        'preferred_state' => 'beta',
      },
    ],
  },
  "5.5.5" => {
    'url' => 'http://hu.php.net/distributions/php-5.5.5.tar.bz2',
    'configure_options' => %w{
      --disable-all
      --enable-bcmath
      --enable-calendar
      --enable-cli
      --enable-ctype
      --enable-dom
      --enable-exif
      --enable-fileinfo
      --enable-filter
      --enable-fpm
      --enable-ftp
      --enable-gd-native-ttf
      --enable-hash
      --enable-inline-optimization
      --enable-intl
      --enable-json
      --enable-libxml
      --enable-mbregex
      --enable-mbstring
      --enable-mysqlnd-compression-support
      --enable-opcache
      --enable-pdo
      --enable-phar
      --enable-posix
      --enable-session
      --enable-shmop
      --enable-simplexml
      --enable-soap
      --enable-sockets
      --enable-sysvmsg
      --enable-sysvsem
      --enable-sysvshm
      --enable-tokenizer
      --enable-wddx
      --enable-xml
      --enable-xmlreader
      --enable-xmlwriter
      --enable-zip
      --with-bz2=/usr
      --with-curl=/usr
      --with-fpm-group=php
      --with-fpm-user=php
      --with-freetype-dir=/usr/local
      --with-gd
      --with-gettext
      --with-iconv
      --with-jpeg-dir=/usr
      --with-libdir=/usr/lib/x86_64-linux-gnu
      --with-libxml-dir=/usr/local
      --with-mcrypt=/usr/local
      --with-mhash
      --with-mysqli=mysqlnd
      --with-openssl
      --with-pdo-mysql=mysqlnd
      --with-pdo-pgsql
      --with-pdo-sqlite
      --with-pear
      --with-pgsql
      --with-png-dir=/usr
      --with-readline
      --with-sqlite3
      --with-tidy
      --with-xmlrpc
      --with-xsl
      --with-zlib
    }.join(' '),
    'config_directives' => {},
    'extensions' => [
      'imagick',
      'timezonedb',
      {
        'name' => 'libevent',
        'version' => '0.1.0',
        'preferred_state' => 'beta',
      },
      {
        'name' => 'xhprof',
        'version' => '0.9.4',
        'preferred_state' => 'beta',
      },
    ],
  }
}
