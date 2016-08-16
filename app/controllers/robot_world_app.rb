require 'models/robot_world'

class RobotWorldApp < Sinatra::Base
  set :root, File.expand_path("..",  __dir__)
  set :method_override, true

  get '/' do
    erb :dashboard
  end

  get'/robots' do
    @robots = robot_world.all
    erb :index
  end

  get '/robots/new' do
    erb :new
  end

  post '/robots' do
    robot_world.create(params[:robot])
    redirect '/robots'
  end

  get '/robots/:name' do |name|
    @robot = robot_world.find(name)
    erb :show
  end

  # get '/tasks/:id/edit' do
  #   @task = task_manager.find(params[:id].to_i)
  #   erb :edit
  # end
  #
  # put '/tasks/:id' do
  #   task_manager.update(params[:id].to_i, params[:task])
  #   redirect "/tasks/#{params[:id]}"
  # end
  #
  # delete '/tasks/:id' do
  #   task_manager.destroy(params[:id].to_i)
  #   redirect '/tasks'
  # end

  def robot_world
    database = YAML::Store.new('db/robot_world')
    @robot_world ||= RobotWorld.new(database)
  end
end
