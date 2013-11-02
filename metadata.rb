name             "phpversion"
maintainer       "Gábor Egyed"
maintainer_email "egyed.gabor@mentha.hu"
license          "MIT"
description      "Installs/Configures phpversion and builds multiple phps"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"

supports "ubuntu"

depends "apt", "~> 2.1.1"
depends "apache2", "~> 1.8.4"
depends "php", "~> 1.2.6"
