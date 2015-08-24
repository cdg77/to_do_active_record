require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
require('./lib/list')
require('./lib/task')
require('pg')

also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end
