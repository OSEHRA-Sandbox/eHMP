name             'ehmp_oracle'
maintainer       "vistacore"
maintainer_email "vistacore@vistacore.us"
license          'All rights reserved'
description      'Installs/Configures oracle-xe_wrapper or oracle_wrapper'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "2.233.44"

depends "oracle_wrapper", "2.233.22"

depends "build-essential", "=2.2.2"
