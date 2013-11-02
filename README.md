# phpversion cookbook

Installs [phpversion](https://github.com/wilmoore/php-version) php version manager
application in a global way and build multiple phps from source.

# Requirements

The cookbook was tested on ubuntu server 12.04 and may not works on other systems.

Requires Chef 11.0.0 or later.


# Usage

Add the `default`recipe to your run list:

    { "run_list": ["recipe[phpversion]"] }

# Attributes

By default phpversion will be installed into `/opt/php-version` directory
and can be used by every user.

See [`attributes/default.rb`](attributes/default.rb) for more information.


# Recipes

## default

Installs the full stack.

## base

Installs dependencies for building php from source.

## install

Installs phpversion.

## phps

Builds different php versions specified by the `phps` attribute.

# LWRPs

## phpversion_script

Runs code in a proper phpversion environment.
The resource has the same attributes as the [`script`](http://docs.opscode.com/resource_script.html) resource and adds the following ones:

`phpenv_version`: php version to use

## phpversion_switch

Switches the current php version. Attributes:

`version`: php version e.g "5.3.25"

# Author

Author:: Gábor Egyed (<egyed.gabor@mentha.hu>)
