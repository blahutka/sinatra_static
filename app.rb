require 'sinatra'
require "sinatra/reloader"
require 'sinatra/cache'
require './models/models'
require "sinatra/advanced_routes"
require './views/cells/posts_cell'

class Portfolio < Sinatra::Base


  set :public_folder, 'public'
  set :views, ['views']
  set :static_site, 'public'
  set :static, true

  PostsCell.append_view_path("views/cells")

  #register Sinatra::Cache
  #set :cache_enabled, true
  #set :cache_environment, :development
  #set :cache_fragments_output_dir, lambda { File.join(settings.public_folder, 'fragments') }
  #set :cache_output_dir, lambda { settings.public_folder }

  configure :development do
    register Sinatra::Reloader
    also_reload File.join(Portfolio.root, 'views/cells/posts/*.*')
    register Sinatra::AdvancedRoutes
  end

  get '/' do
    @post = Post.first
    erb :index
  end

  get '/posts/detail', :provides => :html do

    erb 'posts/detail'.to_sym
  end

end

