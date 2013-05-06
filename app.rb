require 'sinatra'
require 'json'
set :protection, except: :ip_spoofing

commits = []

get '/' do
  erb :index, locals: {commits: commits}
end

post '/commits' do
  commit = JSON.parse(request.body.read, symbolize_names: true)
  commits << commit
  erb :index, locals: {commits: commits}
end
