#
# zimbra module
#
# Copyright 2011, Atizo AG
# Simon Josi simon.josi+puppet(at)atizo.com
#
# This program is free software; you can redistribute 
# it and/or modify it under the terms of the GNU 
# General Public License version 3 as published by 
# the Free Software Foundation.
#

class zimbra {
  include package::gmp
  include package::sysstat
}
