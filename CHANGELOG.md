CHANGELOG
=========

0.7.0
-----
* Remove store_metatile_and_originals configuration
* Add cache configuration
* Remove no longer used metatile size config

0.6.0
-----
* Peg appdirs==1.4.3.
* Configure path_tile_size.

0.5.0
-----
* Peg ujson version

0.4.1
-----
* Correct tilequeue -> tileserver attribute name

0.4.0
-----
* Add configuration for multisqs queue

0.3.2
-----
* Fix whitespace error

0.3.1
-----
* Add configuration for metatile settings

0.3.0
-----
* Update revision variable name
* Update dependencies
  - remove unused
  - add pycountry python dependency
  - add pyclipper python dependency
* Add support for per format buffer configuration
* Support customizable gunicorn listen configuration

0.2.0
-----
* Ensure all python package versions are pegged

0.1.0
-----
* Support configurable formats

0.0.4
-----
* Support custom mapbox-vector-tile revisions

0.0.3
-----
* Introduce an easier way to override revisions

0.0.2
-----
* Add ability to configure worker timeout
* Use variable to represent datasource path

0.0.1
-----
* Initial stable
