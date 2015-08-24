ENV['RACK_ENV'] = 'test'

require('rspec')
require('pg')
require('pry')
require('./lib/task')
require('./lib/list')
