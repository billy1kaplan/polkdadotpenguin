require 'sinatra'
require 'sinatra/json'
require 'sinatra/activerecord'
require 'rack/contrib'

require_relative 'models/friend'
require_relative 'graphql/schema'

set :port, 3030
set :database_file, 'config/database.yml'
use Rack::JSONBodyParser

configure do
  set :protection, except: [:json_csrf]
end

post '/graphql' do
  result = AppSchema.execute(
    params[:query],
    variables: params[:variables],
    context: {}
  )
  json result
end

get '/' do
  File.read('graphiql.html')
end
