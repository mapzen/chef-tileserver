default[:tileserver][:user][:name] = 'tileserver'
default[:tileserver][:user][:enabled] = true

default[:tileserver][:cfg_path] = '/etc/tileserver'
default[:tileserver][:run_path] = '/var/run/tileserver'

default[:tileserver][:gunicorn][:enabled] = true
default[:tileserver][:gunicorn][:listen] = "unix:#{node[:tileserver][:run_path]}/gunicorn.socket"
default[:tileserver][:gunicorn][:worker_class] = 'gevent'
default[:tileserver][:gunicorn][:worker_processes] = node[:cpu][:total] * 2 + 1
default[:tileserver][:gunicorn][:worker_timeout] = 60
# default access log format
default[:tileserver][:gunicorn][:access_log_format] = '%(h)s %(l)s %(u)s %(t)s "%(r)s" %(s)s %(b)s "%(f)s" "%(a)s"'

default[:tileserver][:runit][:svwait] = 180

default[:tileserver][:revision][:raw_tiles] = 'master'
default[:tileserver][:revision][:tilequeue] = 'master'
default[:tileserver][:revision][:mapbox_vector_tile] = 'master'
default[:tileserver][:revision][:tileserver] = 'master'
default[:tileserver][:revision][:vector_datasource] = 'master'

default[:tileserver][:pip_requirements] = %w(
  appdirs==1.4.3
  argparse==1.4.0
  boto==2.48.0
  future==0.16.0
  hiredis==0.2.0
  Jinja2==2.9.6
  MarkupSafe==1.0
  ModestMaps==1.4.7
  protobuf==3.4.0
  psycopg2==2.7.3.2
  pyclipper==1.0.6
  pycountry==17.9.23
  pyproj==1.9.5.1
  python-dateutil==2.6.1
  PyYAML==3.12
  redis==2.10.6
  requests==2.18.4
  Shapely==1.6.2.post1
  six==1.11.0
  StreetNames==0.1.5
  ujson==1.35
  Werkzeug==0.12.2
  wsgiref==0.1.2
  zope.dottedname==4.2
  edtf==2.6.0
  mapbox-vector-tile==1.2.0
)

default[:tileserver][:pip_requirements] += [
  "git+https://github.com/tilezen/raw_tiles@#{node[:tileserver][:revision][:raw_tiles]}#egg=raw_tiles",
  "git+https://github.com/tilezen/tilequeue@#{node[:tileserver][:revision][:tilequeue]}#egg=tilequeue",
  "git+https://github.com/tilezen/tileserver@#{node[:tileserver][:revision][:tileserver]}#egg=tileserver"
]

default[:tileserver][:postgresql][:host] = 'localhost'
default[:tileserver][:postgresql][:port] = 5432
default[:tileserver][:postgresql][:dbnames] = ['osm']
default[:tileserver][:postgresql][:user] = 'osm'
default[:tileserver][:postgresql][:password] = ''

default[:tileserver][:redis][:enabled] = false
default[:tileserver][:store][:enabled] = false
default[:tileserver][:queue][:enabled] = false
default[:tileserver][:queue][:zoom_queue_map] = nil

default[:tileserver][:vector_datasource][:repository] = 'https://github.com/mapzen/vector-datasource.git'
default[:tileserver][:vector_datasource][:path] = "#{node[:tileserver][:cfg_path]}/vector-datasource"

default[:tileserver][:health][:enabled] = true
default[:tileserver][:health][:url] = '/_health'

default[:tileserver][:formats] = nil
default[:tileserver][:buffer] = nil

# mapping from request path to tile size
# eg: {256 => 1, 512 => 2}
default[:tileserver][:path_tile_size]                          = nil

default[:tileserver][:cache][:enabled]                         = false
default[:tileserver][:cache][:type]                            = nil

default[:tileserver][:cache][:redis][:url]                     = nil
default[:tileserver][:cache][:redis][:options]                 = {}

default[:tileserver][:cache][:file][:prefix]                   = nil
