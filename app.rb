require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
require('./lib/list')
require('./lib/task')
require('pg')

also_reload('lib/**/*.rb')

get('/') do
  @tasks = Task.all()
  erb(:index)
end

post('/tasks') do
  description = params.fetch('description')
  task = Task.new({ :description => description, :done => false })
  task.save()

  redirect('/')
end

get ("/tasks/:id/edit") do
  @task = Task.find(params.fetch('id').to_i())
  erb(:task.edit)
end

patch('/tasks/:id') do
  description = params.fetch('description')
  @task = Task.find(params.fetch('id').to_i)
  @task.update({:description => description})
  @tasks = Task.all()
  erb(:index)
end
